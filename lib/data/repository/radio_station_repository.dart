import 'package:portable_radio/domain/model/radio_station.dart';

abstract class RadioStationRepository {
  Future<List<RadioStation>> fetchRadioStations();
}

class RadioStationFetchException implements Exception {}
