import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portable_radio/domain/model/fav_radio_station.dart';
import 'package:portable_radio/domain/model/option.dart';
import 'package:portable_radio/domain/model/radio_station.dart';
import 'package:portable_radio/presentation/view_model/radio_player_cubit.dart';
import 'package:portable_radio/presentation/view_model/radio_player_state.dart';

import '../../mock/mocked_audio_player.dart';
import '../../mock/mocked_get_available_radio_stations_use_case.dart';
import '../../mock/mocked_get_favorite_radio_stations_use_case.dart';
import '../../mock/mocked_save_favorite_radio_stations_use_case.dart';

void main() {
  group(RadioPlayerCubit, () {
    late MockedAudioPlayer mockedAudioPlayer;
    late MockedGetFavoriteRadioStationsUseCase
    mockedGetFavoriteRadioStationsUseCase;
    late MockedGetAvailableRadioStationsUseCase
    mockedGetAvailableRadioStationsUseCase;
    late MockedSaveFavoriteRadioStationsUseCase
    mockedSaveFavoriteRadioStationsUseCase;
    late RadioPlayerCubit cubit;

    final station1 = RadioStation(
      name: 'Test Radio 1',
      uri: Uri.parse('http://test1.com/stream'),
      iconUri: Uri.parse('http://test1.com/icon.png'),
    );

    final station2 = RadioStation(
      name: 'Test Radio 2',
      uri: Uri.parse('http://test2.com/stream'),
      iconUri: Uri.parse('http://test2.com/icon.png'),
    );

    final station3 = RadioStation(
      name: 'Test Radio 3',
      uri: Uri.parse('http://test3.com/stream'),
      iconUri: Uri.parse('http://test3.com/icon.png'),
    );

    setUp(() {
      mockedAudioPlayer = MockedAudioPlayer()
        ..mockSetUrl()
        ..mockStop()
        ..mockPlay()
        ..mockPause()
        ..mockSetVolume();
      mockedGetFavoriteRadioStationsUseCase =
          MockedGetFavoriteRadioStationsUseCase();
      mockedGetAvailableRadioStationsUseCase =
          MockedGetAvailableRadioStationsUseCase();
      mockedSaveFavoriteRadioStationsUseCase =
          MockedSaveFavoriteRadioStationsUseCase();

      cubit = RadioPlayerCubit(
        mockedAudioPlayer,
        mockedGetFavoriteRadioStationsUseCase,
        mockedGetAvailableRadioStationsUseCase,
        mockedSaveFavoriteRadioStationsUseCase,
      );
    });

    tearDown(() {
      cubit.close();
    });

    test('initial state is correct', () {
      expect(cubit.state, equals(RadioPlayerState.initial()));
    });

    group('turnOnOff', () {
      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should turn on radio when initially off',
        build: () {
          mockedGetFavoriteRadioStationsUseCase.mock([station1]);
          mockedGetAvailableRadioStationsUseCase.mock([
            station1,
            station2,
            station3,
          ]);
          return cubit;
        },
        act: (cubit) => cubit.turnOnOff(),
        expect: () => [
          RadioPlayerState.initial().copyWith(
            isOn: true,
            isPlaying: false,
            isPaused: false,
          ),
          RadioPlayerState.initial().copyWith(
            isOn: true,
            isLoading: true,
            tunerValue: 0,
          ),
          RadioPlayerState.initial().copyWith(
            isOn: true,
            isLoading: true,
            tunerValue: 0,
            stations: [
              FavRadioStation(station: station1, isFav: true),
              FavRadioStation(station: station2, isFav: false),
              FavRadioStation(station: station3, isFav: false),
            ],
            favoriteStations: [station1],
            tunerMaxValue: 2,
          ),
          RadioPlayerState.initial().copyWith(
            isOn: true,
            stations: [
              FavRadioStation(station: station1, isFav: true),
              FavRadioStation(station: station2, isFav: false),
              FavRadioStation(station: station3, isFav: false),
            ],
            favoriteStations: [station1],
            tunerMaxValue: 2,
            currentFavStation: const Option.none(),
          ),
          RadioPlayerState.initial().copyWith(
            isOn: true,
            stations: [
              FavRadioStation(station: station1, isFav: true),
              FavRadioStation(station: station2, isFav: false),
              FavRadioStation(station: station3, isFav: false),
            ],
            favoriteStations: [station1],
            tunerMaxValue: 2,
            currentFavStation: Option.some(
              FavRadioStation(station: station1, isFav: true),
            ),
          ),
        ],
        wait: const Duration(milliseconds: 400),
        verify: (_) {
          verifyInOrder([
            () => mockedGetFavoriteRadioStationsUseCase.call(),
            () => mockedGetAvailableRadioStationsUseCase.call(),
            () => mockedAudioPlayer.stop(),
            () => mockedAudioPlayer.setUrl(any()),
          ]);
        },
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should turn off radio when initially on',
        build: () {
          return cubit;
        },
        seed: () => RadioPlayerState.initial().copyWith(
          isOn: true,
          isPlaying: true,
          currentFavStation: Option.some(
            FavRadioStation(station: station1, isFav: true),
          ),
          tunerValue: 1,
        ),
        act: (cubit) => cubit.turnOnOff(),
        expect: () => [
          RadioPlayerState.initial().copyWith(
            isOn: false,
            isPlaying: false,
            isPaused: false,
            currentFavStation: const Option.none(),
            tunerValue: 0,
            tunerMaxValue: 1,
            tunerClock: 1,
          ),
        ],
        verify: (_) {
          verify(() => mockedAudioPlayer.stop()).called(1);
        },
      );
    });

    group('play', () {
      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should start playing when radio is on and has current station',
        build: () => cubit,
        seed: () => RadioPlayerState.initial().copyWith(
          isOn: true,
          currentFavStation: Option.some(
            FavRadioStation(station: station1, isFav: false),
          ),
        ),
        act: (cubit) => cubit.play(),
        expect: () => [
          RadioPlayerState.initial().copyWith(
            isOn: true,
            isPlaying: true,
            isPaused: false,
            currentFavStation: Option.some(
              FavRadioStation(station: station1, isFav: false),
            ),
          ),
        ],
        verify: (_) {
          verify(() => mockedAudioPlayer.play()).called(1);
        },
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should not play when radio is off',
        build: () => cubit,
        seed: () => RadioPlayerState.initial().copyWith(
          isOn: false,
          currentFavStation: Option.some(
            FavRadioStation(station: station1, isFav: false),
          ),
        ),
        act: (cubit) => cubit.play(),
        expect: () => [],
        verify: (_) {
          verifyNever(() => mockedAudioPlayer.play());
        },
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should not play when no current station',
        build: () => cubit,
        seed: () => RadioPlayerState.initial().copyWith(
          isOn: true,
          currentFavStation: const Option.none(),
        ),
        act: (cubit) => cubit.play(),
        expect: () => [],
        verify: (_) {
          verifyNever(() => mockedAudioPlayer.play());
        },
      );
    });

    group('pause', () {
      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should pause when radio is on and has current station',
        build: () => cubit,
        seed: () => RadioPlayerState.initial().copyWith(
          isOn: true,
          isPlaying: true,
          currentFavStation: Option.some(
            FavRadioStation(station: station1, isFav: false),
          ),
        ),
        act: (cubit) => cubit.pause(),
        expect: () => [
          RadioPlayerState.initial().copyWith(
            isOn: true,
            isPlaying: false,
            isPaused: true,
            currentFavStation: Option.some(
              FavRadioStation(station: station1, isFav: false),
            ),
          ),
        ],
        verify: (_) {
          verify(() => mockedAudioPlayer.pause()).called(1);
        },
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should not pause when radio is off',
        build: () => cubit,
        seed: () => RadioPlayerState.initial().copyWith(
          isOn: false,
          isPlaying: true,
          currentFavStation: Option.some(
            FavRadioStation(station: station1, isFav: true),
          ),
        ),
        act: (cubit) => cubit.pause(),
        expect: () => [],
        verify: (_) {
          verifyNever(() => mockedAudioPlayer.pause());
        },
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should not pause when no current station',
        build: () => cubit,
        seed: () => RadioPlayerState.initial().copyWith(
          isOn: true,
          isPlaying: true,
          currentFavStation: const Option.none(),
        ),
        act: (cubit) => cubit.pause(),
        expect: () => [],
        verify: (_) {
          verifyNever(() => mockedAudioPlayer.pause());
        },
      );
    });

    group('changeTuner', () {
      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should change tuner to valid value',
        build: () => cubit,
        seed: () => RadioPlayerState.initial().copyWith(
          isOn: true,
          isPlaying: true,
          stations: [
            FavRadioStation(station: station1, isFav: false),
            FavRadioStation(station: station2, isFav: false),
            FavRadioStation(station: station3, isFav: false),
          ],
          tunerMaxValue: 2,
        ),
        act: (cubit) => cubit.changeTuner(1),
        wait: const Duration(milliseconds: 400),
        expect: () => [
          RadioPlayerState.initial().copyWith(
            isOn: true,
            isPlaying: true,
            stations: [
              FavRadioStation(station: station1, isFav: false),
              FavRadioStation(station: station2, isFav: false),
              FavRadioStation(station: station3, isFav: false),
            ],
            currentFavStation: Option.some(
              FavRadioStation(station: station2, isFav: false),
            ),
            tunerValue: 1,
            tunerMaxValue: 2,
          ),
        ],
        verify: (_) {
          verifyInOrder([
            () => mockedAudioPlayer.stop(),
            () => mockedAudioPlayer.setUrl(any()),
            () => mockedAudioPlayer.play(),
          ]);
        },
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should not change tuner to invalid value (too high)',
        build: () => cubit,
        seed: () => RadioPlayerState.initial().copyWith(
          stations: [FavRadioStation(station: station1, isFav: false)],
        ),
        act: (cubit) => cubit.changeTuner(5),
        expect: () => [],
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should not change tuner to invalid value (too low)',
        build: () => cubit,
        seed: () => RadioPlayerState.initial().copyWith(
          stations: [FavRadioStation(station: station1, isFav: false)],
        ),
        act: (cubit) => cubit.changeTuner(-1),
        expect: () => [],
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should not change tuner when stations list is empty',
        build: () => cubit,
        seed: () => RadioPlayerState.initial().copyWith(stations: []),
        act: (cubit) => cubit.changeTuner(0),
        expect: () => [],
      );
    });

    group('selectFavStation', () {
      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should select existing favorite station',
        build: () => cubit,
        seed: () => RadioPlayerState.initial().copyWith(
          stations: [
            FavRadioStation(station: station1, isFav: true),
            FavRadioStation(station: station2, isFav: false),
            FavRadioStation(station: station3, isFav: true),
          ],
          tunerMaxValue: 2,
        ),
        act: (cubit) => cubit.selectFavStation(station3),
        wait: const Duration(milliseconds: 400),
        expect: () => [
          RadioPlayerState.initial().copyWith(
            stations: [
              FavRadioStation(station: station1, isFav: true),
              FavRadioStation(station: station2, isFav: false),
              FavRadioStation(station: station3, isFav: true),
            ],
            currentFavStation: Option.some(
              FavRadioStation(station: station3, isFav: true),
            ),
            tunerValue: 2,
            tunerMaxValue: 2,
            tunerClock: 1,
          ),
        ],
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should do nothing when selecting non-existing station',
        build: () => cubit,
        seed: () => RadioPlayerState.initial().copyWith(
          stations: [FavRadioStation(station: station1, isFav: true)],
          tunerValue: 0,
        ),
        act: (cubit) => cubit.selectFavStation(station2),
        expect: () => [],
      );
    });

    group('changeVolume', () {
      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should change volume to valid value',
        build: () => cubit,
        act: (cubit) => cubit.changeVolume(75),
        expect: () => [RadioPlayerState.initial().copyWith(volume: 75)],
        verify: (_) {
          verify(() => mockedAudioPlayer.setVolume(any())).called(1);
        },
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should not change volume to invalid value (too high)',
        build: () => cubit,
        act: (cubit) => cubit.changeVolume(150),
        expect: () => [],
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should not change volume to invalid value (too low)',
        build: () => cubit,
        act: (cubit) => cubit.changeVolume(-10),
        expect: () => [],
      );
    });

    group('toggleStationFavorite', () {
      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should mark station as favorite when not favorite',
        build: () {
          mockedSaveFavoriteRadioStationsUseCase.mock();
          return cubit;
        },
        seed: () => RadioPlayerState.initial().copyWith(
          stations: [
            FavRadioStation(station: station1, isFav: true),
            FavRadioStation(station: station2, isFav: false),
          ],
          favoriteStations: [station1],
        ),
        act: (cubit) => cubit.toggleStationFavorite(
          FavRadioStation(station: station2, isFav: false),
        ),
        expect: () => [
          RadioPlayerState.initial().copyWith(
            stations: [
              FavRadioStation(station: station1, isFav: true),
              FavRadioStation(station: station2, isFav: true),
            ],
            favoriteStations: [station1, station2],
            currentFavStation: Option.some(
              FavRadioStation(station: station2, isFav: true),
            ),
          ),
        ],
        verify: (_) {
          verify(
            () => mockedSaveFavoriteRadioStationsUseCase.call(any()),
          ).called(1);
        },
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should unmark station as favorite when favorite',
        build: () {
          mockedSaveFavoriteRadioStationsUseCase.mock();
          return cubit;
        },
        seed: () => RadioPlayerState.initial().copyWith(
          stations: [
            FavRadioStation(station: station1, isFav: true),
            FavRadioStation(station: station2, isFav: true),
          ],
          favoriteStations: [station1, station2],
        ),
        act: (cubit) => cubit.toggleStationFavorite(
          FavRadioStation(station: station2, isFav: true),
        ),
        expect: () => [
          RadioPlayerState.initial().copyWith(
            stations: [
              FavRadioStation(station: station1, isFav: true),
              FavRadioStation(station: station2, isFav: false),
            ],
            favoriteStations: [station1],
          ),
        ],
        verify: (_) {
          verify(
            () => mockedSaveFavoriteRadioStationsUseCase.call(any()),
          ).called(1);
        },
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should update currentFavStation when unmarking currently selected favorite station',
        build: () {
          mockedSaveFavoriteRadioStationsUseCase.mock();
          return cubit;
        },
        seed: () => RadioPlayerState.initial().copyWith(
          stations: [
            FavRadioStation(station: station1, isFav: true),
            FavRadioStation(station: station2, isFav: true),
          ],
          favoriteStations: [station1, station2],
          currentFavStation: Option.some(
            FavRadioStation(station: station2, isFav: true),
          ),
        ),
        act: (cubit) => cubit.unmarkStationAsFavorite(station2),
        expect: () => [
          RadioPlayerState.initial().copyWith(
            stations: [
              FavRadioStation(station: station1, isFav: true),
              FavRadioStation(station: station2, isFav: false),
            ],
            favoriteStations: [station1],
            currentFavStation: Option.some(
              FavRadioStation(station: station2, isFav: false),
            ),
          ),
        ],
        verify: (_) {
          verify(
            () => mockedSaveFavoriteRadioStationsUseCase.call(any()),
          ).called(1);
        },
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should not update currentFavStation when unmarking different station',
        build: () {
          mockedSaveFavoriteRadioStationsUseCase.mock();
          return cubit;
        },
        seed: () => RadioPlayerState.initial().copyWith(
          stations: [
            FavRadioStation(station: station1, isFav: true),
            FavRadioStation(station: station2, isFav: true),
            FavRadioStation(station: station3, isFav: true),
          ],
          favoriteStations: [station1, station2, station3],
          currentFavStation: Option.some(
            FavRadioStation(station: station1, isFav: true),
          ),
        ),
        act: (cubit) => cubit.unmarkStationAsFavorite(station2),
        expect: () => [
          RadioPlayerState.initial().copyWith(
            stations: [
              FavRadioStation(station: station1, isFav: true),
              FavRadioStation(station: station2, isFav: false),
              FavRadioStation(station: station3, isFav: true),
            ],
            favoriteStations: [station1, station3],
            currentFavStation: Option.some(
              FavRadioStation(station: station1, isFav: true),
            ),
          ),
        ],
        verify: (_) {
          verify(
            () => mockedSaveFavoriteRadioStationsUseCase.call(any()),
          ).called(1);
        },
      );
    });

    group('error handling', () {
      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should handle error when fetching favorite stations fails',
        build: () {
          mockedGetFavoriteRadioStationsUseCase.mockError(
            Exception('Failed to fetch favorites'),
          );
          mockedGetAvailableRadioStationsUseCase.mock([]);
          return cubit;
        },
        act: (cubit) => cubit.turnOnOff(),
        expect: () => [
          RadioPlayerState.initial().copyWith(isOn: true),
          RadioPlayerState.initial().copyWith(isOn: true, isLoading: true),
          RadioPlayerState.initial().copyWith(isOn: true, isLoading: false),
        ],
        wait: const Duration(milliseconds: 400),
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should handle error when fetching available stations fails',
        build: () {
          mockedGetFavoriteRadioStationsUseCase.mock([]);
          mockedGetAvailableRadioStationsUseCase.mockError(
            Exception('Failed to fetch stations'),
          );
          return cubit;
        },
        act: (cubit) => cubit.turnOnOff(),
        expect: () => [
          RadioPlayerState.initial().copyWith(isOn: true),
          RadioPlayerState.initial().copyWith(isOn: true, isLoading: true),
          RadioPlayerState.initial().copyWith(isOn: true, isLoading: false),
        ],
        wait: const Duration(milliseconds: 400),
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'should handle error when setting station URL fails during changeTuner',
        build: () {
          mockedAudioPlayer.mockSetUrlError(Exception('Failed to set URL'));
          return cubit;
        },
        seed: () => RadioPlayerState.initial().copyWith(
          isPlaying: true,
          stations: [
            FavRadioStation(station: station1, isFav: false),
            FavRadioStation(station: station2, isFav: false),
          ],
          tunerMaxValue: 1,
        ),
        act: (cubit) => cubit.changeTuner(1),
        wait: const Duration(milliseconds: 400),
        expect: () => [
          RadioPlayerState.initial().copyWith(
            isPlaying: true,
            stations: [
              FavRadioStation(station: station1, isFav: false),
              FavRadioStation(station: station2, isFav: false),
            ],
            currentFavStation: Option.some(
              FavRadioStation(station: station2, isFav: false),
            ),
            tunerValue: 1,
            tunerMaxValue: 1,
          ),
        ],
      );
    });
  });
}
