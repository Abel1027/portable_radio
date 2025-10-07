// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RadioPlayerState {

 List<FavRadioStation> get stations; Option<FavRadioStation> get currentFavStation; List<RadioStation> get favoriteStations; bool get isLoading; bool get isOn; bool get isPlaying; bool get isPaused; int get tunerValue; int get tunerMinValue; int get tunerMaxValue; DateTime get tunerClock; double get volume; double get volumeMinValue; double get volumeMaxValue;
/// Create a copy of RadioPlayerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadioPlayerStateCopyWith<RadioPlayerState> get copyWith => _$RadioPlayerStateCopyWithImpl<RadioPlayerState>(this as RadioPlayerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadioPlayerState&&const DeepCollectionEquality().equals(other.stations, stations)&&(identical(other.currentFavStation, currentFavStation) || other.currentFavStation == currentFavStation)&&const DeepCollectionEquality().equals(other.favoriteStations, favoriteStations)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isOn, isOn) || other.isOn == isOn)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.isPaused, isPaused) || other.isPaused == isPaused)&&(identical(other.tunerValue, tunerValue) || other.tunerValue == tunerValue)&&(identical(other.tunerMinValue, tunerMinValue) || other.tunerMinValue == tunerMinValue)&&(identical(other.tunerMaxValue, tunerMaxValue) || other.tunerMaxValue == tunerMaxValue)&&(identical(other.tunerClock, tunerClock) || other.tunerClock == tunerClock)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.volumeMinValue, volumeMinValue) || other.volumeMinValue == volumeMinValue)&&(identical(other.volumeMaxValue, volumeMaxValue) || other.volumeMaxValue == volumeMaxValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(stations),currentFavStation,const DeepCollectionEquality().hash(favoriteStations),isLoading,isOn,isPlaying,isPaused,tunerValue,tunerMinValue,tunerMaxValue,tunerClock,volume,volumeMinValue,volumeMaxValue);

@override
String toString() {
  return 'RadioPlayerState(stations: $stations, currentFavStation: $currentFavStation, favoriteStations: $favoriteStations, isLoading: $isLoading, isOn: $isOn, isPlaying: $isPlaying, isPaused: $isPaused, tunerValue: $tunerValue, tunerMinValue: $tunerMinValue, tunerMaxValue: $tunerMaxValue, tunerClock: $tunerClock, volume: $volume, volumeMinValue: $volumeMinValue, volumeMaxValue: $volumeMaxValue)';
}


}

/// @nodoc
abstract mixin class $RadioPlayerStateCopyWith<$Res>  {
  factory $RadioPlayerStateCopyWith(RadioPlayerState value, $Res Function(RadioPlayerState) _then) = _$RadioPlayerStateCopyWithImpl;
@useResult
$Res call({
 List<FavRadioStation> stations, Option<FavRadioStation> currentFavStation, List<RadioStation> favoriteStations, bool isLoading, bool isOn, bool isPlaying, bool isPaused, int tunerValue, int tunerMinValue, int tunerMaxValue, DateTime tunerClock, double volume, double volumeMinValue, double volumeMaxValue
});


$OptionCopyWith<FavRadioStation, $Res> get currentFavStation;

}
/// @nodoc
class _$RadioPlayerStateCopyWithImpl<$Res>
    implements $RadioPlayerStateCopyWith<$Res> {
  _$RadioPlayerStateCopyWithImpl(this._self, this._then);

  final RadioPlayerState _self;
  final $Res Function(RadioPlayerState) _then;

/// Create a copy of RadioPlayerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stations = null,Object? currentFavStation = null,Object? favoriteStations = null,Object? isLoading = null,Object? isOn = null,Object? isPlaying = null,Object? isPaused = null,Object? tunerValue = null,Object? tunerMinValue = null,Object? tunerMaxValue = null,Object? tunerClock = null,Object? volume = null,Object? volumeMinValue = null,Object? volumeMaxValue = null,}) {
  return _then(_self.copyWith(
stations: null == stations ? _self.stations : stations // ignore: cast_nullable_to_non_nullable
as List<FavRadioStation>,currentFavStation: null == currentFavStation ? _self.currentFavStation : currentFavStation // ignore: cast_nullable_to_non_nullable
as Option<FavRadioStation>,favoriteStations: null == favoriteStations ? _self.favoriteStations : favoriteStations // ignore: cast_nullable_to_non_nullable
as List<RadioStation>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isOn: null == isOn ? _self.isOn : isOn // ignore: cast_nullable_to_non_nullable
as bool,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,isPaused: null == isPaused ? _self.isPaused : isPaused // ignore: cast_nullable_to_non_nullable
as bool,tunerValue: null == tunerValue ? _self.tunerValue : tunerValue // ignore: cast_nullable_to_non_nullable
as int,tunerMinValue: null == tunerMinValue ? _self.tunerMinValue : tunerMinValue // ignore: cast_nullable_to_non_nullable
as int,tunerMaxValue: null == tunerMaxValue ? _self.tunerMaxValue : tunerMaxValue // ignore: cast_nullable_to_non_nullable
as int,tunerClock: null == tunerClock ? _self.tunerClock : tunerClock // ignore: cast_nullable_to_non_nullable
as DateTime,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,volumeMinValue: null == volumeMinValue ? _self.volumeMinValue : volumeMinValue // ignore: cast_nullable_to_non_nullable
as double,volumeMaxValue: null == volumeMaxValue ? _self.volumeMaxValue : volumeMaxValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of RadioPlayerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OptionCopyWith<FavRadioStation, $Res> get currentFavStation {
  
  return $OptionCopyWith<FavRadioStation, $Res>(_self.currentFavStation, (value) {
    return _then(_self.copyWith(currentFavStation: value));
  });
}
}


/// Adds pattern-matching-related methods to [RadioPlayerState].
extension RadioPlayerStatePatterns on RadioPlayerState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadioPlayerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadioPlayerState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadioPlayerState value)  $default,){
final _that = this;
switch (_that) {
case _RadioPlayerState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadioPlayerState value)?  $default,){
final _that = this;
switch (_that) {
case _RadioPlayerState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FavRadioStation> stations,  Option<FavRadioStation> currentFavStation,  List<RadioStation> favoriteStations,  bool isLoading,  bool isOn,  bool isPlaying,  bool isPaused,  int tunerValue,  int tunerMinValue,  int tunerMaxValue,  DateTime tunerClock,  double volume,  double volumeMinValue,  double volumeMaxValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadioPlayerState() when $default != null:
return $default(_that.stations,_that.currentFavStation,_that.favoriteStations,_that.isLoading,_that.isOn,_that.isPlaying,_that.isPaused,_that.tunerValue,_that.tunerMinValue,_that.tunerMaxValue,_that.tunerClock,_that.volume,_that.volumeMinValue,_that.volumeMaxValue);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FavRadioStation> stations,  Option<FavRadioStation> currentFavStation,  List<RadioStation> favoriteStations,  bool isLoading,  bool isOn,  bool isPlaying,  bool isPaused,  int tunerValue,  int tunerMinValue,  int tunerMaxValue,  DateTime tunerClock,  double volume,  double volumeMinValue,  double volumeMaxValue)  $default,) {final _that = this;
switch (_that) {
case _RadioPlayerState():
return $default(_that.stations,_that.currentFavStation,_that.favoriteStations,_that.isLoading,_that.isOn,_that.isPlaying,_that.isPaused,_that.tunerValue,_that.tunerMinValue,_that.tunerMaxValue,_that.tunerClock,_that.volume,_that.volumeMinValue,_that.volumeMaxValue);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FavRadioStation> stations,  Option<FavRadioStation> currentFavStation,  List<RadioStation> favoriteStations,  bool isLoading,  bool isOn,  bool isPlaying,  bool isPaused,  int tunerValue,  int tunerMinValue,  int tunerMaxValue,  DateTime tunerClock,  double volume,  double volumeMinValue,  double volumeMaxValue)?  $default,) {final _that = this;
switch (_that) {
case _RadioPlayerState() when $default != null:
return $default(_that.stations,_that.currentFavStation,_that.favoriteStations,_that.isLoading,_that.isOn,_that.isPlaying,_that.isPaused,_that.tunerValue,_that.tunerMinValue,_that.tunerMaxValue,_that.tunerClock,_that.volume,_that.volumeMinValue,_that.volumeMaxValue);case _:
  return null;

}
}

}

/// @nodoc


class _RadioPlayerState implements RadioPlayerState {
  const _RadioPlayerState({required final  List<FavRadioStation> stations, required this.currentFavStation, required final  List<RadioStation> favoriteStations, required this.isLoading, required this.isOn, required this.isPlaying, required this.isPaused, required this.tunerValue, required this.tunerMinValue, required this.tunerMaxValue, required this.tunerClock, required this.volume, required this.volumeMinValue, required this.volumeMaxValue}): _stations = stations,_favoriteStations = favoriteStations;
  

 final  List<FavRadioStation> _stations;
@override List<FavRadioStation> get stations {
  if (_stations is EqualUnmodifiableListView) return _stations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stations);
}

@override final  Option<FavRadioStation> currentFavStation;
 final  List<RadioStation> _favoriteStations;
@override List<RadioStation> get favoriteStations {
  if (_favoriteStations is EqualUnmodifiableListView) return _favoriteStations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoriteStations);
}

@override final  bool isLoading;
@override final  bool isOn;
@override final  bool isPlaying;
@override final  bool isPaused;
@override final  int tunerValue;
@override final  int tunerMinValue;
@override final  int tunerMaxValue;
@override final  DateTime tunerClock;
@override final  double volume;
@override final  double volumeMinValue;
@override final  double volumeMaxValue;

/// Create a copy of RadioPlayerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadioPlayerStateCopyWith<_RadioPlayerState> get copyWith => __$RadioPlayerStateCopyWithImpl<_RadioPlayerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadioPlayerState&&const DeepCollectionEquality().equals(other._stations, _stations)&&(identical(other.currentFavStation, currentFavStation) || other.currentFavStation == currentFavStation)&&const DeepCollectionEquality().equals(other._favoriteStations, _favoriteStations)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isOn, isOn) || other.isOn == isOn)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.isPaused, isPaused) || other.isPaused == isPaused)&&(identical(other.tunerValue, tunerValue) || other.tunerValue == tunerValue)&&(identical(other.tunerMinValue, tunerMinValue) || other.tunerMinValue == tunerMinValue)&&(identical(other.tunerMaxValue, tunerMaxValue) || other.tunerMaxValue == tunerMaxValue)&&(identical(other.tunerClock, tunerClock) || other.tunerClock == tunerClock)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.volumeMinValue, volumeMinValue) || other.volumeMinValue == volumeMinValue)&&(identical(other.volumeMaxValue, volumeMaxValue) || other.volumeMaxValue == volumeMaxValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_stations),currentFavStation,const DeepCollectionEquality().hash(_favoriteStations),isLoading,isOn,isPlaying,isPaused,tunerValue,tunerMinValue,tunerMaxValue,tunerClock,volume,volumeMinValue,volumeMaxValue);

@override
String toString() {
  return 'RadioPlayerState(stations: $stations, currentFavStation: $currentFavStation, favoriteStations: $favoriteStations, isLoading: $isLoading, isOn: $isOn, isPlaying: $isPlaying, isPaused: $isPaused, tunerValue: $tunerValue, tunerMinValue: $tunerMinValue, tunerMaxValue: $tunerMaxValue, tunerClock: $tunerClock, volume: $volume, volumeMinValue: $volumeMinValue, volumeMaxValue: $volumeMaxValue)';
}


}

/// @nodoc
abstract mixin class _$RadioPlayerStateCopyWith<$Res> implements $RadioPlayerStateCopyWith<$Res> {
  factory _$RadioPlayerStateCopyWith(_RadioPlayerState value, $Res Function(_RadioPlayerState) _then) = __$RadioPlayerStateCopyWithImpl;
@override @useResult
$Res call({
 List<FavRadioStation> stations, Option<FavRadioStation> currentFavStation, List<RadioStation> favoriteStations, bool isLoading, bool isOn, bool isPlaying, bool isPaused, int tunerValue, int tunerMinValue, int tunerMaxValue, DateTime tunerClock, double volume, double volumeMinValue, double volumeMaxValue
});


@override $OptionCopyWith<FavRadioStation, $Res> get currentFavStation;

}
/// @nodoc
class __$RadioPlayerStateCopyWithImpl<$Res>
    implements _$RadioPlayerStateCopyWith<$Res> {
  __$RadioPlayerStateCopyWithImpl(this._self, this._then);

  final _RadioPlayerState _self;
  final $Res Function(_RadioPlayerState) _then;

/// Create a copy of RadioPlayerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stations = null,Object? currentFavStation = null,Object? favoriteStations = null,Object? isLoading = null,Object? isOn = null,Object? isPlaying = null,Object? isPaused = null,Object? tunerValue = null,Object? tunerMinValue = null,Object? tunerMaxValue = null,Object? tunerClock = null,Object? volume = null,Object? volumeMinValue = null,Object? volumeMaxValue = null,}) {
  return _then(_RadioPlayerState(
stations: null == stations ? _self._stations : stations // ignore: cast_nullable_to_non_nullable
as List<FavRadioStation>,currentFavStation: null == currentFavStation ? _self.currentFavStation : currentFavStation // ignore: cast_nullable_to_non_nullable
as Option<FavRadioStation>,favoriteStations: null == favoriteStations ? _self._favoriteStations : favoriteStations // ignore: cast_nullable_to_non_nullable
as List<RadioStation>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isOn: null == isOn ? _self.isOn : isOn // ignore: cast_nullable_to_non_nullable
as bool,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,isPaused: null == isPaused ? _self.isPaused : isPaused // ignore: cast_nullable_to_non_nullable
as bool,tunerValue: null == tunerValue ? _self.tunerValue : tunerValue // ignore: cast_nullable_to_non_nullable
as int,tunerMinValue: null == tunerMinValue ? _self.tunerMinValue : tunerMinValue // ignore: cast_nullable_to_non_nullable
as int,tunerMaxValue: null == tunerMaxValue ? _self.tunerMaxValue : tunerMaxValue // ignore: cast_nullable_to_non_nullable
as int,tunerClock: null == tunerClock ? _self.tunerClock : tunerClock // ignore: cast_nullable_to_non_nullable
as DateTime,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,volumeMinValue: null == volumeMinValue ? _self.volumeMinValue : volumeMinValue // ignore: cast_nullable_to_non_nullable
as double,volumeMaxValue: null == volumeMaxValue ? _self.volumeMaxValue : volumeMaxValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of RadioPlayerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OptionCopyWith<FavRadioStation, $Res> get currentFavStation {
  
  return $OptionCopyWith<FavRadioStation, $Res>(_self.currentFavStation, (value) {
    return _then(_self.copyWith(currentFavStation: value));
  });
}
}

// dart format on
