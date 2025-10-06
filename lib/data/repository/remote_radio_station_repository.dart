import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:portable_radio/config/constant.dart';
import 'package:portable_radio/data/mapper/data_radio_station_mapper.dart';
import 'package:portable_radio/data/model/data_radio_station.dart';
import 'package:portable_radio/data/repository/radio_station_repository.dart';
import 'package:portable_radio/domain/model/radio_station.dart';

@lazySingleton
class RemoteRadioStationRepository implements RadioStationRepository {
  RemoteRadioStationRepository(this._dio, this._mapper);

  final Dio _dio;
  final DataRadioStationMapper _mapper;

  @override
  Future<List<RadioStation>> fetchRadioStations() async {
    final response = await _dio.get(Constant.radioServer);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      final dataRadioStations =
          data.map((station) => DataRadioStation.fromJson(station)).toList();
      return dataRadioStations
          .map((dataRadioStation) => _mapper.map(dataRadioStation))
          .where((radioStation) => radioStation != null)
          .cast<RadioStation>()
          .toList();
    } else {
      throw RadioStationFetchException();
    }
  }
}
