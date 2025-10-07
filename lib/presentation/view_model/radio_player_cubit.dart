import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:portable_radio/domain/model/fav_radio_station.dart';
import 'package:portable_radio/domain/model/option.dart';
import 'package:portable_radio/domain/model/radio_station.dart';
import 'package:portable_radio/domain/use_case/get_available_radio_stations_use_case.dart';
import 'package:portable_radio/domain/use_case/get_favorite_radio_stations_use_case.dart';
import 'package:portable_radio/domain/use_case/save_favorite_radio_stations_use_case.dart';
import 'package:portable_radio/presentation/view_model/radio_player_state.dart';

@singleton
class RadioPlayerCubit extends Cubit<RadioPlayerState> {
  RadioPlayerCubit(
    this._audioPlayer,
    this._getFavoriteRadioStationsUseCase,
    this._getAvailableRadioStationsUseCase,
    this._saveFavoriteRadioStationsUseCase,
  ) : super(RadioPlayerState.initial());

  final AudioPlayer _audioPlayer;
  final GetFavoriteRadioStationsUseCase _getFavoriteRadioStationsUseCase;
  final GetAvailableRadioStationsUseCase _getAvailableRadioStationsUseCase;
  final SaveFavoriteRadioStationsUseCase _saveFavoriteRadioStationsUseCase;

  Timer? _debounce;
  CancelableOperation<void>? _loadStationOperation;

  void turnOnOff() {
    if (state.isOn) {
      _turnOff();
    } else {
      _turnOn();
    }
  }

  void _turnOn() {
    emit(state.copyWith(isOn: true, isPlaying: false, isPaused: false));
    _searchStations();
  }

  void _turnOff() {
    emit(
      state.copyWith(
        isOn: false,
        isPlaying: false,
        isPaused: false,
        currentFavStation: Option.none(),
        tunerValue: 0,
        tunerClock: DateTime.now(),
        tunerMaxValue: 1,
      ),
    );

    _audioPlayer.stop();
  }

  void play() {
    if (state.isOn && state.currentFavStation.isSome) {
      emit(state.copyWith(isPlaying: true, isPaused: false));

      _audioPlayer.play();
    }
  }

  void pause() {
    if (state.isOn && state.currentFavStation.isSome) {
      emit(state.copyWith(isPlaying: false, isPaused: true));

      _audioPlayer.pause();
    }
  }

  Future<void> changeTuner(
    int newTunerValue, {
    bool updateClock = false,
  }) async {
    if (newTunerValue < state.tunerMinValue ||
        newTunerValue > state.tunerMaxValue ||
        state.stations.isEmpty) {
      return;
    }

    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () {
      _loadStationOperation?.cancel();

      final currentStation = state.stations[newTunerValue];

      emit(
        state.copyWith(
          currentFavStation: Option.some(currentStation),
          tunerValue: newTunerValue,
          tunerClock: updateClock ? DateTime.now() : state.tunerClock,
        ),
      );

      try {
        _loadStationOperation = CancelableOperation.fromFuture(
          _setStationUrl(currentStation.station.uri),
        );

        if (state.isPlaying) {
          _audioPlayer.play();
        }
      } catch (e) {
        print('error setting url: $e');
      }
    });
  }

  Future<void> _setStationUrl(Uri uri) async {
    await _audioPlayer.stop();
    await _audioPlayer.setUrl(uri.toString());
  }

  void selectFavStation(RadioStation station) {
    final index = state.stations.indexWhere(
      (s) => s.station.uri == station.uri,
    );

    if (index != -1) {
      // Update the tuner clock to restart the KnobButton widget
      changeTuner(index, updateClock: true);
    }
  }

  void changeVolume(double newVolume) {
    if (newVolume < state.volumeMinValue || newVolume > state.volumeMaxValue) {
      return;
    }

    emit(state.copyWith(volume: newVolume));

    _audioPlayer.setVolume(newVolume / 100);
  }

  Future<void> _searchStations() async {
    emit(state.copyWith(isLoading: true, tunerValue: 0));

    var favoriteStations = <RadioStation>[];

    try {
      favoriteStations = await _getFavoriteRadioStationsUseCase();
    } catch (e) {
      print('error fetching favorite stations: $e');
    }

    try {
      final stations = await _getAvailableRadioStationsUseCase();

      var stationsMarkedAsFav = stations.map((station) {
        final isFav = favoriteStations.any((fav) => fav.uri == station.uri);
        return FavRadioStation(station: station, isFav: isFav);
      }).toList();

      emit(
        state.copyWith(
          stations: stationsMarkedAsFav,
          favoriteStations: favoriteStations,
          tunerMaxValue: stationsMarkedAsFav.length - 1,
        ),
      );

      changeTuner(0);
    } catch (e) {
      print('error fetching stations: $e');
    }

    emit(state.copyWith(isLoading: false));
  }

  void toggleStationFavorite(FavRadioStation target) {
    if (target.isFav) {
      unmarkStationAsFavorite(target.station);
    } else {
      _markStationAsFavorite(target.station);
    }
  }

  void _markStationAsFavorite(RadioStation target) {
    final updatedStation = FavRadioStation(station: target, isFav: true);

    final updatedStations = state.stations.map((station) {
      if (station.station.uri == target.uri) {
        return updatedStation;
      }
      return station;
    }).toList();

    final updatedFavoriteStations = List<RadioStation>.from(
      state.favoriteStations,
    )..add(target);

    emit(
      state.copyWith(
        stations: updatedStations,
        favoriteStations: updatedFavoriteStations,
        currentFavStation: Option.some(updatedStation),
      ),
    );

    _saveFavoriteRadioStationsUseCase(updatedFavoriteStations);
  }

  void unmarkStationAsFavorite(RadioStation target) {
    final updatedStation = FavRadioStation(station: target, isFav: false);

    final updatedStations = state.stations.map((station) {
      if (station.station.uri == target.uri) {
        return updatedStation;
      }
      return station;
    }).toList();

    final updatedFavoriteStations = state.favoriteStations
        .where((station) => station.uri != target.uri)
        .toList();

    emit(
      state.copyWith(
        stations: updatedStations,
        favoriteStations: updatedFavoriteStations,
        currentFavStation: state.currentFavStation.map(
          () => state.currentFavStation,
          (value) => value.station.uri == target.uri
              ? Option.some(updatedStation)
              : state.currentFavStation,
        ),
      ),
    );

    _saveFavoriteRadioStationsUseCase(updatedFavoriteStations);
  }
}
