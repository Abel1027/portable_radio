import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_radio_station.freezed.dart';
part 'data_radio_station.g.dart';

@freezed
abstract class DataRadioStation with _$DataRadioStation {
  const factory DataRadioStation({
    required String name,
    @JsonKey(name: 'url_resolved') required String url,
    @JsonKey(name: 'favicon') required String iconUrl,
  }) = _DataRadioStation;

  factory DataRadioStation.fromJson(Map<String, Object?> json) =>
      _$DataRadioStationFromJson(json);
}
