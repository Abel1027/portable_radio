import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:portable_radio/config/constant.dart';
import 'package:portable_radio/domain/model/radio_station.dart';
import 'package:portable_radio/domain/model/radio_station_adapter.dart';

@module
abstract class HiveInjectableModule {
  @preResolve
  @lazySingleton
  Future<HiveInterface> hive() async {
    final hive = await _initHive();
    _registerAdapters(hive);
    _openHiveBoxes(hive);
    return hive;
  }

  Future<HiveInterface> _initHive() async {
    final dir = await getApplicationDocumentsDirectory();
    final hive = Hive;
    hive.init(dir.path);
    return hive;
  }

  void _openHiveBoxes(HiveInterface hive) async {
    await hive.openBox<RadioStation>(Constant.favoriteRadioStationsBox);
  }

  void _registerAdapters(HiveInterface hive) {
    hive.registerAdapter(RadioStationAdapter());
  }
}
