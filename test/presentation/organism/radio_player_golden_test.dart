import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portable_radio/di/provider.dart';
import 'package:portable_radio/domain/model/fav_radio_station.dart';
import 'package:portable_radio/domain/model/option.dart';
import 'package:portable_radio/domain/model/radio_station.dart';
import 'package:portable_radio/presentation/organism/radio_player.dart';
import 'package:portable_radio/presentation/view_model/radio_player_cubit.dart';
import 'package:portable_radio/presentation/view_model/radio_player_state.dart';

import '../../mock/mocked_radio_player_cubit.dart';
import '../test_helper.dart';

void main() {
  group(RadioPlayer, () {
    late MockedRadioPlayerCubit mockedRadioPlayerCubit;

    const double width = 800;
    const double height = 400;

    setUpAll(() {
      mockedRadioPlayerCubit = MockedRadioPlayerCubit();

      getIt.registerSingleton<RadioPlayerCubit>(mockedRadioPlayerCubit);
    });

    goldenTest(
      'renders correctly',
      fileName: 'radio_player_golden',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'initial state',

            child: SizedBox(
              width: width,
              height: height,
              child: Builder(
                builder: (context) {
                  whenListen(
                    mockedRadioPlayerCubit,
                    Stream.fromIterable([RadioPlayerState.initial()]),
                    initialState: RadioPlayerState.initial(),
                  );

                  return MediaQuery(
                    data: const MediaQueryData(size: Size(width, height)),
                    child: const RadioPlayer().useTestWrapper(),
                  );
                },
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'with current station',
            child: SizedBox(
              width: width,
              height: height,
              child: Builder(
                builder: (context) {
                  whenListen(
                    mockedRadioPlayerCubit,
                    Stream.fromIterable([
                      RadioPlayerState.initial().copyWith(
                        isOn: true,
                        currentFavStation: Option.some(
                          FavRadioStation(
                            station: RadioStation(
                              name: 'Test',
                              uri: Uri.parse('https://test.com/stream'),
                              iconUri: Uri.parse('https://test.com/icon.png'),
                            ),
                            isFav: false,
                          ),
                        ),
                      ),
                    ]),
                    initialState: RadioPlayerState.initial(),
                  );

                  return MediaQuery(
                    data: const MediaQueryData(size: Size(width, height)),
                    child: const RadioPlayer().useTestWrapper(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  });
}
