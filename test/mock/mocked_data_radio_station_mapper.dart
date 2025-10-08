import 'package:mocktail/mocktail.dart';
import 'package:portable_radio/data/mapper/data_radio_station_mapper.dart';
import 'package:portable_radio/domain/model/radio_station.dart';

class MockedDataRadioStationMapper extends Mock
    implements DataRadioStationMapper {
  void mock(RadioStation expected) {
    when(() => map(any())).thenReturn(expected);
  }
}
