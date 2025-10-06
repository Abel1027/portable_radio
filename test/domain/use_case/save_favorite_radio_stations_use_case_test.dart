import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portable_radio/domain/model/radio_station.dart';
import 'package:portable_radio/domain/use_case/save_favorite_radio_stations_use_case.dart';

import '../../mock/mocked_local_radio_station_repository.dart';

void main() {
  group(SaveFavoriteRadioStationsUseCase, () {
    late MockedLocalRadioStationRepository mockedLocalRadioStationRepository;
    late SaveFavoriteRadioStationsUseCase useCase;

    setUp(() {
      mockedLocalRadioStationRepository = MockedLocalRadioStationRepository();
      useCase = SaveFavoriteRadioStationsUseCase(
        mockedLocalRadioStationRepository,
      );
    });

    test('should call saveFavoriteRadioStation on repository', () async {
      final radioStation = RadioStation(
        name: 'name',
        uri: Uri(),
        iconUri: Uri(),
      );
      mockedLocalRadioStationRepository.mockSave(radioStation);

      await useCase([radioStation]);

      verify(
        () =>
            mockedLocalRadioStationRepository.saveRadioStations([radioStation]),
      ).called(1);
    });
  });
}
