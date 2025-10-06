import 'package:mocktail/mocktail.dart';
import 'package:portable_radio/data/repository/local_radio_station_repository.dart';
import 'package:portable_radio/domain/model/radio_station.dart';

class MockedLocalRadioStationRepository extends Mock
    implements LocalRadioStationRepository {
  void mockFetch(List<RadioStation> expected) {
    when(() => fetchRadioStations()).thenAnswer((_) async => expected);
  }

  void mockSave(RadioStation station) {
    when(() => saveRadioStations(any())).thenAnswer((_) => Future.value());
  }
}
