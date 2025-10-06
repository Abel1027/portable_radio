import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portable_radio/domain/model/radio_station.dart';
import 'package:portable_radio/domain/use_case/get_favorite_radio_stations_use_case.dart';

import '../../mock/mocked_local_radio_station_repository.dart';

void main() {
  group(GetFavoriteRadioStationsUseCase, () {
    late MockedLocalRadioStationRepository mockedLocalRadioStationRepository;
    late GetFavoriteRadioStationsUseCase useCase;

    setUp(() {
      mockedLocalRadioStationRepository = MockedLocalRadioStationRepository();
      useCase = GetFavoriteRadioStationsUseCase(
        mockedLocalRadioStationRepository,
      );
    });

    test('should return available stations from repository', () async {
      final radioStation = RadioStation(
        name: 'name',
        uri: Uri(),
        iconUri: Uri(),
      );
      mockedLocalRadioStationRepository.mockFetch([radioStation]);

      final result = await useCase();

      verify(
        () => mockedLocalRadioStationRepository.fetchRadioStations(),
      ).called(1);

      expect(result, equals([radioStation]));
    });
  });
}
