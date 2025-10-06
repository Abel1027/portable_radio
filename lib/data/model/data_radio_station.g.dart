// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_radio_station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DataRadioStation _$DataRadioStationFromJson(Map<String, dynamic> json) =>
    _DataRadioStation(
      name: json['name'] as String,
      url: json['url_resolved'] as String,
      iconUrl: json['favicon'] as String,
    );

Map<String, dynamic> _$DataRadioStationToJson(_DataRadioStation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url_resolved': instance.url,
      'favicon': instance.iconUrl,
    };
