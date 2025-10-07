import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portable_radio/domain/model/radio_station.dart';

part 'fav_radio_station.freezed.dart';

@freezed
abstract class FavRadioStation with _$FavRadioStation {
  const factory FavRadioStation({
    required RadioStation station,
    required bool isFav,
  }) = _FavRadioStation;
}