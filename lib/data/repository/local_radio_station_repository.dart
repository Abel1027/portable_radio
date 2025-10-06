import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:portable_radio/config/constant.dart';
import 'package:portable_radio/data/repository/radio_station_repository.dart';
import 'package:portable_radio/domain/model/radio_station.dart';

@lazySingleton
class LocalRadioStationRepository implements RadioStationRepository {
  LocalRadioStationRepository();

  @override
  Future<List<RadioStation>> fetchRadioStations() async {
    final box = Hive.box<RadioStation>(Constant.favoriteRadioStationsBox);
    return box.values.toList();
  }

  Future<void> saveRadioStations(List<RadioStation> stations) async {
    final box = await Hive.box<RadioStation>(Constant.favoriteRadioStationsBox);
    await box.clear();
    for (var station in stations) {
      await box.add(station);
    }
  }
}
