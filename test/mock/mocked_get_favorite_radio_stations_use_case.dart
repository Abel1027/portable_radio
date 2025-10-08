import 'package:mocktail/mocktail.dart';
import 'package:portable_radio/domain/model/radio_station.dart';
import 'package:portable_radio/domain/use_case/get_favorite_radio_stations_use_case.dart';

class MockedGetFavoriteRadioStationsUseCase extends Mock
    implements GetFavoriteRadioStationsUseCase {
  void mock(List<RadioStation> expected) {
    when(() => call()).thenAnswer((_) async => expected);
  }

  void mockError(Exception expected) {
    when(() => call()).thenThrow(expected);
  }
}
