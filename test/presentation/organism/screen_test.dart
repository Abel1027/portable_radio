import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portable_radio/domain/model/fav_radio_station.dart';
import 'package:portable_radio/domain/model/radio_station.dart';
import 'package:portable_radio/presentation/organism/screen.dart';

import '../test_helper.dart';

void main() {
  const double width = 800;
  const double height = 400;

  group('callbacks', () {
    final widget = SizedBox(
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
        ],
        onStationFavIconPressed: (_) {},
        onFavStationIconPressed: (_) {},
        onFavStationPressed: (_) {},
      ).useTestWrapper(),
    );

    testWidgets('press on favorite icon', (tester) async {
      await tester.pumpWidget(widget);

      await tester.tap(find.byType(IconButton).first);
      await tester.tap(find.byType(IconButton).last);
      await tester.pump();
    });

    testWidgets('press on favorite station', (tester) async {
      await tester.pumpWidget(widget);

      await tester.tap(find.byType(InkWell).at(2));
      await tester.pump();
    });
  });
}
