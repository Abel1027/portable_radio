import 'package:injectable/injectable.dart';
import 'package:portable_radio/data/repository/radio_station_repository.dart';
import 'package:portable_radio/domain/model/radio_station.dart';

@lazySingleton
class GetAvailableRadioStationsUseCase {
  GetAvailableRadioStationsUseCase(this._repository);

  final RadioStationRepository _repository;

  Future<List<RadioStation>> call() async {
    return await _repository.fetchRadioStations();
  }
}
