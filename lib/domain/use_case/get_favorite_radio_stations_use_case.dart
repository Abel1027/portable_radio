import 'package:injectable/injectable.dart';
import 'package:portable_radio/data/repository/local_radio_station_repository.dart';
import 'package:portable_radio/domain/model/radio_station.dart';

@lazySingleton
class GetFavoriteRadioStationsUseCase {
  GetFavoriteRadioStationsUseCase(this._repository);

  final LocalRadioStationRepository _repository;

  Future<List<RadioStation>> call() async {
    return await _repository.fetchRadioStations();
  }
}
