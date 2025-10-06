// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RadioStation {
  String get name;
  Uri get uri;
  Uri get iconUri;

  /// Create a copy of RadioStation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RadioStationCopyWith<RadioStation> get copyWith =>
      _$RadioStationCopyWithImpl<RadioStation>(
          this as RadioStation, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RadioStation &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.iconUri, iconUri) || other.iconUri == iconUri));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, uri, iconUri);

  @override
  String toString() {
    return 'RadioStation(name: $name, uri: $uri, iconUri: $iconUri)';
  }
}

/// @nodoc
abstract mixin class $RadioStationCopyWith<$Res> {
  factory $RadioStationCopyWith(
          RadioStation value, $Res Function(RadioStation) _then) =
      _$RadioStationCopyWithImpl;
  @useResult
  $Res call({String name, Uri uri, Uri iconUri});
}

/// @nodoc
class _$RadioStationCopyWithImpl<$Res> implements $RadioStationCopyWith<$Res> {
  _$RadioStationCopyWithImpl(this._self, this._then);

  final RadioStation _self;
  final $Res Function(RadioStation) _then;

  /// Create a copy of RadioStation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uri = null,
    Object? iconUri = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uri: null == uri
          ? _self.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
      iconUri: null == iconUri
          ? _self.iconUri
          : iconUri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// Adds pattern-matching-related methods to [RadioStation].
extension RadioStationPatterns on RadioStation {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RadioStation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RadioStation() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RadioStation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioStation():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RadioStation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioStation() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String name, Uri uri, Uri iconUri)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RadioStation() when $default != null:
        return $default(_that.name, _that.uri, _that.iconUri);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String name, Uri uri, Uri iconUri) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioStation():
        return $default(_that.name, _that.uri, _that.iconUri);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String name, Uri uri, Uri iconUri)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioStation() when $default != null:
        return $default(_that.name, _that.uri, _that.iconUri);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RadioStation implements RadioStation {
  const _RadioStation(
      {required this.name, required this.uri, required this.iconUri});

  @override
  final String name;
  @override
  final Uri uri;
  @override
  final Uri iconUri;

  /// Create a copy of RadioStation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RadioStationCopyWith<_RadioStation> get copyWith =>
      __$RadioStationCopyWithImpl<_RadioStation>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RadioStation &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.iconUri, iconUri) || other.iconUri == iconUri));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, uri, iconUri);

  @override
  String toString() {
    return 'RadioStation(name: $name, uri: $uri, iconUri: $iconUri)';
  }
}

/// @nodoc
abstract mixin class _$RadioStationCopyWith<$Res>
    implements $RadioStationCopyWith<$Res> {
  factory _$RadioStationCopyWith(
          _RadioStation value, $Res Function(_RadioStation) _then) =
      __$RadioStationCopyWithImpl;
  @override
  @useResult
  $Res call({String name, Uri uri, Uri iconUri});
}

/// @nodoc
class __$RadioStationCopyWithImpl<$Res>
    implements _$RadioStationCopyWith<$Res> {
  __$RadioStationCopyWithImpl(this._self, this._then);

  final _RadioStation _self;
  final $Res Function(_RadioStation) _then;

  /// Create a copy of RadioStation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? uri = null,
    Object? iconUri = null,
  }) {
    return _then(_RadioStation(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uri: null == uri
          ? _self.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
      iconUri: null == iconUri
          ? _self.iconUri
          : iconUri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

// dart format on
