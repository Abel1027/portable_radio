import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portable_radio/domain/model/fav_radio_station.dart';
import 'package:portable_radio/domain/model/option.dart';
import 'package:portable_radio/domain/model/radio_station.dart';

part 'radio_player_state.freezed.dart';

@freezed
abstract class RadioPlayerState with _$RadioPlayerState {
  const factory RadioPlayerState({
    required List<FavRadioStation> stations,
    required Option<FavRadioStation> currentFavStation,
    required List<RadioStation> favoriteStations,
    required bool isLoading,
    required bool isOn,
    required bool isPlaying,
    required bool isPaused,
    required int tunerValue,
    required int tunerMinValue,
    required int tunerMaxValue,
    required int tunerClock,
    required double volume,
    required double volumeMinValue,
    required double volumeMaxValue,
  }) = _RadioPlayerState;

  factory RadioPlayerState.initial() => RadioPlayerState(
    stations: [],
    currentFavStation: Option.none(),
    favoriteStations: [],
    isLoading: false,
    isOn: false,
    isPlaying: false,
    isPaused: false,
    tunerValue: 0,
    tunerMinValue: 0,
    tunerMaxValue: 1,
    tunerClock: 0,
    volume: 50,
    volumeMinValue: 0,
    volumeMaxValue: 100,
  );
}
