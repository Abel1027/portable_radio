import 'package:injectable/injectable.dart';
import 'package:portable_radio/data/repository/local_radio_station_repository.dart';
import 'package:portable_radio/domain/model/radio_station.dart';

@lazySingleton
class SaveFavoriteRadioStationsUseCase {
  SaveFavoriteRadioStationsUseCase(this._repository);

  final LocalRadioStationRepository _repository;

  Future<void> call(List<RadioStation> stations) async {
    await _repository.saveRadioStations(stations);
  }
}
