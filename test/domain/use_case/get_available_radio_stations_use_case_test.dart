import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portable_radio/domain/model/radio_station.dart';
import 'package:portable_radio/domain/use_case/get_available_radio_stations_use_case.dart';

import '../../mock/mocked_remote_radio_station_repository.dart';

void main() {
  group(GetAvailableRadioStationsUseCase, () {
    late MockedRemoteRadioStationRepository mockedRemoteRadioStationRepository;
    late GetAvailableRadioStationsUseCase useCase;

    setUp(() {
      mockedRemoteRadioStationRepository = MockedRemoteRadioStationRepository();
      useCase = GetAvailableRadioStationsUseCase(
        mockedRemoteRadioStationRepository,
      );
    });

    test('should return available stations from repository', () async {
      final radioStation = RadioStation(
        name: 'name',
        uri: Uri(),
        iconUri: Uri(),
      );
      mockedRemoteRadioStationRepository.mock([radioStation]);

      final result = await useCase();

      verify(
        () => mockedRemoteRadioStationRepository.fetchRadioStations(),
      ).called(1);

      expect(result, equals([radioStation]));
    });
  });
}
