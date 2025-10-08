import 'package:mocktail/mocktail.dart';
import 'package:portable_radio/domain/model/radio_station.dart';
import 'package:portable_radio/domain/use_case/get_available_radio_stations_use_case.dart';

class MockedGetAvailableRadioStationsUseCase extends Mock
    implements GetAvailableRadioStationsUseCase {
  void mock(List<RadioStation> expected) {
    when(() => call()).thenAnswer((_) async => expected);
  }

  void mockError(Exception expected) {
    when(() => call()).thenThrow(expected);
  }
}
