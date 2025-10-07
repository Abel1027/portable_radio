// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fav_radio_station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavRadioStation {

 RadioStation get station; bool get isFav;
/// Create a copy of FavRadioStation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavRadioStationCopyWith<FavRadioStation> get copyWith => _$FavRadioStationCopyWithImpl<FavRadioStation>(this as FavRadioStation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavRadioStation&&(identical(other.station, station) || other.station == station)&&(identical(other.isFav, isFav) || other.isFav == isFav));
}


@override
int get hashCode => Object.hash(runtimeType,station,isFav);

@override
String toString() {
  return 'FavRadioStation(station: $station, isFav: $isFav)';
}


}

/// @nodoc
abstract mixin class $FavRadioStationCopyWith<$Res>  {
  factory $FavRadioStationCopyWith(FavRadioStation value, $Res Function(FavRadioStation) _then) = _$FavRadioStationCopyWithImpl;
@useResult
$Res call({
 RadioStation station, bool isFav
});


$RadioStationCopyWith<$Res> get station;

}
/// @nodoc
class _$FavRadioStationCopyWithImpl<$Res>
    implements $FavRadioStationCopyWith<$Res> {
  _$FavRadioStationCopyWithImpl(this._self, this._then);

  final FavRadioStation _self;
  final $Res Function(FavRadioStation) _then;

/// Create a copy of FavRadioStation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? station = null,Object? isFav = null,}) {
  return _then(_self.copyWith(
station: null == station ? _self.station : station // ignore: cast_nullable_to_non_nullable
as RadioStation,isFav: null == isFav ? _self.isFav : isFav // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of FavRadioStation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadioStationCopyWith<$Res> get station {
  
  return $RadioStationCopyWith<$Res>(_self.station, (value) {
    return _then(_self.copyWith(station: value));
  });
}
}


/// Adds pattern-matching-related methods to [FavRadioStation].
extension FavRadioStationPatterns on FavRadioStation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavRadioStation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavRadioStation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavRadioStation value)  $default,){
final _that = this;
switch (_that) {
case _FavRadioStation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavRadioStation value)?  $default,){
final _that = this;
switch (_that) {
case _FavRadioStation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RadioStation station,  bool isFav)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavRadioStation() when $default != null:
return $default(_that.station,_that.isFav);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RadioStation station,  bool isFav)  $default,) {final _that = this;
switch (_that) {
case _FavRadioStation():
return $default(_that.station,_that.isFav);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RadioStation station,  bool isFav)?  $default,) {final _that = this;
switch (_that) {
case _FavRadioStation() when $default != null:
return $default(_that.station,_that.isFav);case _:
  return null;

}
}

}

/// @nodoc


class _FavRadioStation implements FavRadioStation {
  const _FavRadioStation({required this.station, required this.isFav});
  

@override final  RadioStation station;
@override final  bool isFav;

/// Create a copy of FavRadioStation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavRadioStationCopyWith<_FavRadioStation> get copyWith => __$FavRadioStationCopyWithImpl<_FavRadioStation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavRadioStation&&(identical(other.station, station) || other.station == station)&&(identical(other.isFav, isFav) || other.isFav == isFav));
}


@override
int get hashCode => Object.hash(runtimeType,station,isFav);

@override
String toString() {
  return 'FavRadioStation(station: $station, isFav: $isFav)';
}


}

/// @nodoc
abstract mixin class _$FavRadioStationCopyWith<$Res> implements $FavRadioStationCopyWith<$Res> {
  factory _$FavRadioStationCopyWith(_FavRadioStation value, $Res Function(_FavRadioStation) _then) = __$FavRadioStationCopyWithImpl;
@override @useResult
$Res call({
 RadioStation station, bool isFav
});


@override $RadioStationCopyWith<$Res> get station;

}
/// @nodoc
class __$FavRadioStationCopyWithImpl<$Res>
    implements _$FavRadioStationCopyWith<$Res> {
  __$FavRadioStationCopyWithImpl(this._self, this._then);

  final _FavRadioStation _self;
  final $Res Function(_FavRadioStation) _then;

/// Create a copy of FavRadioStation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? station = null,Object? isFav = null,}) {
  return _then(_FavRadioStation(
station: null == station ? _self.station : station // ignore: cast_nullable_to_non_nullable
as RadioStation,isFav: null == isFav ? _self.isFav : isFav // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of FavRadioStation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadioStationCopyWith<$Res> get station {
  
  return $RadioStationCopyWith<$Res>(_self.station, (value) {
    return _then(_self.copyWith(station: value));
  });
}
}

// dart format on
