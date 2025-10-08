import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portable_radio/presentation/molecule/station_detail.dart';

void main() {
  group(StationDetail, () {
    goldenTest(
      'renders correctly',
      fileName: 'station_detail_golden',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'vertically displayed and marked as favorite',
            child: StationDetail(
              direction: Axis.vertical,
              imageUri: Uri.parse('https://example.com/image.png'),
              imageSize: 50,
              name: 'Station Name',
              isFav: true,
              onFavIconPressed: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'vertically displayed and unmarked as favorite',
            child: StationDetail(
              direction: Axis.vertical,
              imageUri: Uri.parse('https://example.com/image.png'),
              imageSize: 50,
              name: 'Station Name',
              isFav: false,
              onFavIconPressed: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'horizontally displayed and marked as favorite',
            child: StationDetail(
              direction: Axis.horizontal,
              imageUri: Uri.parse('https://example.com/image.png'),
              imageSize: 50,
              name: 'Station Name',
              isFav: true,
              onFavIconPressed: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'horizontally displayed and unmarked as favorite',
            child: StationDetail(
              direction: Axis.horizontal,
              imageUri: Uri.parse('https://example.com/image.png'),
              imageSize: 50,
              name: 'Station Name',
              isFav: false,
              onFavIconPressed: () {},
            ),
          ),
        ],
      ),
    );
  });
}
