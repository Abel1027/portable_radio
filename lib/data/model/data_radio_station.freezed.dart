// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_radio_station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DataRadioStation {

 String get name;@JsonKey(name: 'url_resolved') String get url;@JsonKey(name: 'favicon') String get iconUrl;
/// Create a copy of DataRadioStation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataRadioStationCopyWith<DataRadioStation> get copyWith => _$DataRadioStationCopyWithImpl<DataRadioStation>(this as DataRadioStation, _$identity);

  /// Serializes this DataRadioStation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataRadioStation&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url,iconUrl);

@override
String toString() {
  return 'DataRadioStation(name: $name, url: $url, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class $DataRadioStationCopyWith<$Res>  {
  factory $DataRadioStationCopyWith(DataRadioStation value, $Res Function(DataRadioStation) _then) = _$DataRadioStationCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(name: 'url_resolved') String url,@JsonKey(name: 'favicon') String iconUrl
});




}
/// @nodoc
class _$DataRadioStationCopyWithImpl<$Res>
    implements $DataRadioStationCopyWith<$Res> {
  _$DataRadioStationCopyWithImpl(this._self, this._then);

  final DataRadioStation _self;
  final $Res Function(DataRadioStation) _then;

/// Create a copy of DataRadioStation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? url = null,Object? iconUrl = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DataRadioStation].
extension DataRadioStationPatterns on DataRadioStation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DataRadioStation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataRadioStation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DataRadioStation value)  $default,){
final _that = this;
switch (_that) {
case _DataRadioStation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DataRadioStation value)?  $default,){
final _that = this;
switch (_that) {
case _DataRadioStation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'url_resolved')  String url, @JsonKey(name: 'favicon')  String iconUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DataRadioStation() when $default != null:
return $default(_that.name,_that.url,_that.iconUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'url_resolved')  String url, @JsonKey(name: 'favicon')  String iconUrl)  $default,) {final _that = this;
switch (_that) {
case _DataRadioStation():
return $default(_that.name,_that.url,_that.iconUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(name: 'url_resolved')  String url, @JsonKey(name: 'favicon')  String iconUrl)?  $default,) {final _that = this;
switch (_that) {
case _DataRadioStation() when $default != null:
return $default(_that.name,_that.url,_that.iconUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DataRadioStation implements DataRadioStation {
  const _DataRadioStation({required this.name, @JsonKey(name: 'url_resolved') required this.url, @JsonKey(name: 'favicon') required this.iconUrl});
  factory _DataRadioStation.fromJson(Map<String, dynamic> json) => _$DataRadioStationFromJson(json);

@override final  String name;
@override@JsonKey(name: 'url_resolved') final  String url;
@override@JsonKey(name: 'favicon') final  String iconUrl;

/// Create a copy of DataRadioStation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataRadioStationCopyWith<_DataRadioStation> get copyWith => __$DataRadioStationCopyWithImpl<_DataRadioStation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DataRadioStationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataRadioStation&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url,iconUrl);

@override
String toString() {
  return 'DataRadioStation(name: $name, url: $url, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class _$DataRadioStationCopyWith<$Res> implements $DataRadioStationCopyWith<$Res> {
  factory _$DataRadioStationCopyWith(_DataRadioStation value, $Res Function(_DataRadioStation) _then) = __$DataRadioStationCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(name: 'url_resolved') String url,@JsonKey(name: 'favicon') String iconUrl
});




}
/// @nodoc
class __$DataRadioStationCopyWithImpl<$Res>
    implements _$DataRadioStationCopyWith<$Res> {
  __$DataRadioStationCopyWithImpl(this._self, this._then);

  final _DataRadioStation _self;
  final $Res Function(_DataRadioStation) _then;

/// Create a copy of DataRadioStation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? url = null,Object? iconUrl = null,}) {
  return _then(_DataRadioStation(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
