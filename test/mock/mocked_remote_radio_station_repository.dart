import 'package:mocktail/mocktail.dart';
import 'package:portable_radio/data/repository/remote_radio_station_repository.dart';
import 'package:portable_radio/domain/model/radio_station.dart';

class MockedRemoteRadioStationRepository extends Mock
    implements RemoteRadioStationRepository {
  void mock(List<RadioStation> expected) {
    when(() => fetchRadioStations()).thenAnswer((_) async => expected);
  }
}
