import 'package:mocktail/mocktail.dart';
import 'package:portable_radio/domain/use_case/save_favorite_radio_stations_use_case.dart';

class MockedSaveFavoriteRadioStationsUseCase extends Mock
    implements SaveFavoriteRadioStationsUseCase {
  void mock() {
    when(() => call(any())).thenAnswer((_) => Future.value());
  }
}
