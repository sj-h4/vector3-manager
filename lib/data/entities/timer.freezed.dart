// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimerTearOff {
  const _$TimerTearOff();

  _Timer call({bool isStarted = false}) {
    return _Timer(
      isStarted: isStarted,
    );
  }
}

/// @nodoc
const $Timer = _$TimerTearOff();

/// @nodoc
mixin _$Timer {
  bool get isStarted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerCopyWith<Timer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerCopyWith<$Res> {
  factory $TimerCopyWith(Timer value, $Res Function(Timer) then) =
      _$TimerCopyWithImpl<$Res>;
  $Res call({bool isStarted});
}

/// @nodoc
class _$TimerCopyWithImpl<$Res> implements $TimerCopyWith<$Res> {
  _$TimerCopyWithImpl(this._value, this._then);

  final Timer _value;
  // ignore: unused_field
  final $Res Function(Timer) _then;

  @override
  $Res call({
    Object? isStarted = freezed,
  }) {
    return _then(_value.copyWith(
      isStarted: isStarted == freezed
          ? _value.isStarted
          : isStarted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TimerCopyWith<$Res> implements $TimerCopyWith<$Res> {
  factory _$TimerCopyWith(_Timer value, $Res Function(_Timer) then) =
      __$TimerCopyWithImpl<$Res>;
  @override
  $Res call({bool isStarted});
}

/// @nodoc
class __$TimerCopyWithImpl<$Res> extends _$TimerCopyWithImpl<$Res>
    implements _$TimerCopyWith<$Res> {
  __$TimerCopyWithImpl(_Timer _value, $Res Function(_Timer) _then)
      : super(_value, (v) => _then(v as _Timer));

  @override
  _Timer get _value => super._value as _Timer;

  @override
  $Res call({
    Object? isStarted = freezed,
  }) {
    return _then(_Timer(
      isStarted: isStarted == freezed
          ? _value.isStarted
          : isStarted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Timer with DiagnosticableTreeMixin implements _Timer {
  const _$_Timer({this.isStarted = false});

  @JsonKey()
  @override
  final bool isStarted;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Timer(isStarted: $isStarted)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Timer'))
      ..add(DiagnosticsProperty('isStarted', isStarted));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Timer &&
            const DeepCollectionEquality().equals(other.isStarted, isStarted));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isStarted));

  @JsonKey(ignore: true)
  @override
  _$TimerCopyWith<_Timer> get copyWith =>
      __$TimerCopyWithImpl<_Timer>(this, _$identity);
}

abstract class _Timer implements Timer {
  const factory _Timer({bool isStarted}) = _$_Timer;

  @override
  bool get isStarted;
  @override
  @JsonKey(ignore: true)
  _$TimerCopyWith<_Timer> get copyWith => throw _privateConstructorUsedError;
}
