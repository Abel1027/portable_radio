import 'package:flutter_test/flutter_test.dart';
import 'package:portable_radio/data/mapper/data_radio_station_mapper.dart';
import 'package:portable_radio/data/model/data_radio_station.dart';
import 'package:portable_radio/domain/model/radio_station.dart';

void main() {
  group(DataRadioStationMapper, () {
    late DataRadioStationMapper mapper;

    setUp(() {
      mapper = DataRadioStationMapper();
    });

    test('should return null when url is invalid', () {
      final result = mapper.map(
        const DataRadioStation(
          name: 'name',
          url: '::Not valid URI::',
          iconUrl: 'https://valid-url.com/icon.png',
        ),
      );

      expect(result, isNull);
    });

    test('should return null when iconUrl is invalid', () {
      final result = mapper.map(
        const DataRadioStation(
          name: 'name',
          url: 'https://valid-url.com',
          iconUrl: '::Not valid URI::',
        ),
      );

      expect(result, isNull);
    });

    test('should map correctly when all fields are valid', () {
      final result = mapper.map(
        const DataRadioStation(
          name: 'name',
          url: 'https://valid-url.com',
          iconUrl: 'https://valid-url.com/icon.png',
        ),
      );

      expect(
        result,
        equals(
          RadioStation(
            name: 'name',
            uri: Uri.parse('https://valid-url.com'),
            iconUri: Uri.parse('https://valid-url.com/icon.png'),
          ),
        ),
      );
    });
  });
}
