import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portable_radio/data/repository/radio_station_repository.dart';
import 'package:portable_radio/data/repository/remote_radio_station_repository.dart';
import 'package:portable_radio/domain/model/radio_station.dart';

import '../../fake/faked.dart';
import '../../mock/mocked_data_radio_station_mapper.dart';
import '../../mock/mocked_dio.dart';

void main() {
  group(RemoteRadioStationRepository, () {
    late MockedDio mockedDio;
    late MockedDataRadioStationMapper mockedDataRadioStationMapper;
    late RemoteRadioStationRepository repository;

    setUp(() {
      registerFallbackValue(FakedDataRadioStation());

      mockedDio = MockedDio();
      mockedDataRadioStationMapper = MockedDataRadioStationMapper();
      repository = RemoteRadioStationRepository(
        mockedDio,
        mockedDataRadioStationMapper,
      );
    });

    group('fetchRadioStations', () {
      test('should throw exception when status code is not 200', () {
        mockedDio.mockGet(
          Response(requestOptions: RequestOptions(path: ''), statusCode: 404),
        );

        expect(
          () async => repository.fetchRadioStations(),
          throwsA(isA<RadioStationFetchException>()),
        );
      });

      test('should fetch data successfully when status code is 200', () async {
        mockedDio.mockGet(
          Response(
            data: [
              {
                "name": "Test Radio 1",
                "url_resolved": "http://testradio1.com/stream",
                "favicon": "http://testradio1.com/icon.png",
              },
              {
                "name": "Test Radio 2",
                "url_resolved": "http://testradio2.com/stream",
                "favicon": "http://testradio2.com/icon.png",
              },
            ],
            requestOptions: RequestOptions(path: ''),
            statusCode: 200,
          ),
        );
        mockedDataRadioStationMapper.mock(
          RadioStation(name: 'name', uri: Uri(), iconUri: Uri()),
        );

        final result = await repository.fetchRadioStations();

        expect(result, hasLength(2));
      });
    });
  });
}
