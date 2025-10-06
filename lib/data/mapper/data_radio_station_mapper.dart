import 'package:injectable/injectable.dart';
import 'package:portable_radio/data/model/data_radio_station.dart';
import 'package:portable_radio/domain/model/radio_station.dart';

@lazySingleton
class DataRadioStationMapper {
  RadioStation? map(DataRadioStation dataRadioStation) {
    final uri = Uri.tryParse(dataRadioStation.url);
    final iconUri = Uri.tryParse(dataRadioStation.iconUrl);

    if (uri == null || iconUri == null) {
      return null;
    }

    return RadioStation(
      name: dataRadioStation.name,
      uri: uri,
      iconUri: iconUri,
    );
  }
}
