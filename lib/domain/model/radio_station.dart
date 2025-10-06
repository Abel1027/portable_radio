import 'package:freezed_annotation/freezed_annotation.dart';

part 'radio_station.freezed.dart';

@freezed
abstract class RadioStation with _$RadioStation {
  const factory RadioStation({
    required String name,
    required Uri uri,
    required Uri iconUri,
  }) = _RadioStation;
}
