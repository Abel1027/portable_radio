import 'package:freezed_annotation/freezed_annotation.dart';

part 'option.freezed.dart';

@freezed
class Option<T> with _$Option<T> {
  const factory Option.some(T value) = Some<T>;
  const factory Option.none() = None<T>;

  const Option._();

  bool get isSome => this is Some<T>;

  bool get isNone => this is None<T>;

  R map<R>(R Function() onNone, R Function(T value) onSome) =>
      when(none: onNone, some: onSome);
}
