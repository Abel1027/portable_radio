import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portable_radio/domain/model/fav_radio_station.dart';
import 'package:portable_radio/domain/model/radio_station.dart';
import 'package:portable_radio/presentation/organism/screen.dart';

import '../test_helper.dart';

void main() {
  group(Screen, () {
    const double width = 800;
    const double height = 400;

    goldenTest(
      'renders correctly',
      fileName: 'screen_golden',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'off',
            child: SizedBox(
              width: width,
              height: height,
              child: Screen(
                isOn: false,
                isLoading: false,
                currentFavStation: null,
                favoriteStations: const [],
                onStationFavIconPressed: (_) {},
                onFavStationIconPressed: (_) {},
                onFavStationPressed: (_) {},
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'on',
            child: SizedBox(
              width: width,
              height: height,
              child: Screen(
                isOn: true,
                isLoading: false,
                currentFavStation: null,
                favoriteStations: const [],
                onStationFavIconPressed: (_) {},
                onFavStationIconPressed: (_) {},
                onFavStationPressed: (_) {},
              ).useTestWrapper(),
            ),
          ),
          GoldenTestScenario(
            name: 'loading',
            child: SizedBox(
              width: width,
              height: height,
              child: Screen(
                isOn: true,
                isLoading: true,
                currentFavStation: null,
                favoriteStations: const [],
                onStationFavIconPressed: (_) {},
                onFavStationIconPressed: (_) {},
                onFavStationPressed: (_) {},
              ).useTestWrapper(),
            ),
          ),
          GoldenTestScenario(
            name: 'show current station that is favorite',
            child: SizedBox(
              width: width,
              height: height,
              child: Screen(
                isOn: true,
                isLoading: false,
                currentFavStation: FavRadioStation(
                  station: RadioStation(
                    name: 'Test Station',
                    uri: Uri.parse('http://test.com'),
                    iconUri: Uri.parse('http://test.com/icon.png'),
                  ),
                  isFav: true,
                ),
                favoriteStations: const [],
                onStationFavIconPressed: (_) {},
                onFavStationIconPressed: (_) {},
                onFavStationPressed: (_) {},
              ).useTestWrapper(),
            ),
          ),
          GoldenTestScenario(
            name: 'show current station that is not favorite',
            child: SizedBox(
              width: width,
              height: height,
              child: Screen(
                isOn: true,
                isLoading: false,
                currentFavStation: FavRadioStation(
                  station: RadioStation(
                    name: 'Test Station',
                    uri: Uri.parse('http://test.com'),
                    iconUri: Uri.parse('http://test.com/icon.png'),
                  ),
                  isFav: false,
                ),
                favoriteStations: const [],
                onStationFavIconPressed: (_) {},
                onFavStationIconPressed: (_) {},
                onFavStationPressed: (_) {},
              ).useTestWrapper(),
            ),
          ),
          GoldenTestScenario(
            name: 'show only favorite stations',
            child: SizedBox(
              width: width,
              height: height,
              child: Screen(
                isOn: true,
                isLoading: false,
                currentFavStation: null,
                favoriteStations: [
                  RadioStation(
                    name: 'Fav Station 1',
                    uri: Uri.parse('http://fav1.com'),
                    iconUri: Uri.parse('http://fav1.com/icon.png'),
                  ),
                  RadioStation(
                    name: 'Fav Station 2',
                    uri: Uri.parse('http://fav2.com'),
                    iconUri: Uri.parse('http://fav2.com/icon.png'),
                  ),
                ],
                onStationFavIconPressed: (_) {},
                onFavStationIconPressed: (_) {},
                onFavStationPressed: (_) {},
              ).useTestWrapper(),
            ),
          ),
          GoldenTestScenario(
            name: 'show both current station and favorite stations',
            child: SizedBox(
              width: width,
              height: height,
              child: Screen(
                isOn: true,
                isLoading: false,
                currentFavStation: FavRadioStation(
                  station: RadioStation(
                    name: 'Test Station',
                    uri: Uri.parse('http://test.com'),
                    iconUri: Uri.parse('http://test.com/icon.png'),
                  ),
                  isFav: false,
                ),
                favoriteStations: [
                  RadioStation(
                    name: 'Fav Station 1',
                    uri: Uri.parse('http://fav1.com'),
                    iconUri: Uri.parse('http://fav1.com/icon.png'),
                  ),
                  RadioStation(
                    name: 'Fav Station 2',
                    uri: Uri.parse('http://fav2.com'),
                    iconUri: Uri.parse('http://fav2.com/icon.png'),
                  ),
                ],
                onStationFavIconPressed: (_) {},
                onFavStationIconPressed: (_) {},
                onFavStationPressed: (_) {},
              ).useTestWrapper(),
            ),
          ),
        ],
      ),
    );
  });
}
