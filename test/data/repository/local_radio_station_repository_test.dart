import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:portable_radio/config/constant.dart';
import 'package:portable_radio/data/repository/local_radio_station_repository.dart';
import 'package:portable_radio/domain/model/radio_station.dart';
import 'package:portable_radio/domain/model/radio_station_adapter.dart';

void main() {
  group(LocalRadioStationRepository, () {
    late LocalRadioStationRepository repository;
    late Box<RadioStation> testBox;
    late Directory tempDir;

    final station1 = RadioStation(
      name: 'Test Radio 1',
      uri: Uri.parse('http://test1.com'),
      iconUri: Uri.parse('http://test1.com/icon.png'),
    );
    final station2 = RadioStation(
      name: 'Test Radio 2',
      uri: Uri.parse('http://test2.com'),
      iconUri: Uri.parse('http://test2.com/icon.png'),
    );

    setUpAll(() async {
      tempDir = await Directory.systemTemp.createTemp('hive_test_path');
      Hive.init(tempDir.path);
      Hive.registerAdapter(RadioStationAdapter());
    });

    setUp(() async {
      testBox = await Hive.openBox<RadioStation>(
        Constant.favoriteRadioStationsBox,
      );

      await testBox.clear();

      repository = LocalRadioStationRepository();
    });

    tearDown(() async {
      await testBox.clear();
      await testBox.close();
    });

    tearDownAll(() async {
      if (tempDir.existsSync()) {
        await tempDir.delete(recursive: true);
      }
    });

    group('fetchRadioStations', () {
      test('should return empty list when no stations are stored', () async {
        await testBox.clear();

        final result = await repository.fetchRadioStations();

        expect(result, isEmpty);
      });

      test('should return list of stored radio stations', () async {
        await testBox.add(station1);
        await testBox.add(station2);

        final result = await repository.fetchRadioStations();

        expect(result, hasLength(2));
        expect(result[0], equals(station1));
        expect(result[1], equals(station2));
      });
    });

    group('saveRadioStations', () {
      test('should save radio stations to storage', () async {
        final stations = [station1, station2];

        await repository.saveRadioStations(stations);

        final result = await repository.fetchRadioStations();

        expect(result, hasLength(2));
        expect(result[0], equals(station1));
        expect(result[1], equals(station2));
      });

      test('should clear existing stations before saving new ones', () async {
        final initialStation = station1;
        await testBox.add(initialStation);

        final newStations = [station2];

        await repository.saveRadioStations(newStations);

        final result = await repository.fetchRadioStations();

        expect(result, hasLength(1));
        expect(result[0], equals(station2));
      });
    });
  });
}
