// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vector3.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$Vector3TearOff {
  const _$Vector3TearOff();

  _Vector3 call(
      {double? power,
      double? rotation,
      String? deviceStatus,
      bool isConnected = false}) {
    return _Vector3(
      power: power,
      rotation: rotation,
      deviceStatus: deviceStatus,
      isConnected: isConnected,
    );
  }
}

/// @nodoc
const $Vector3 = _$Vector3TearOff();

/// @nodoc
mixin _$Vector3 {
  double? get power => throw _privateConstructorUsedError;
  double? get rotation => throw _privateConstructorUsedError;
  String? get deviceStatus => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $Vector3CopyWith<Vector3> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Vector3CopyWith<$Res> {
  factory $Vector3CopyWith(Vector3 value, $Res Function(Vector3) then) =
      _$Vector3CopyWithImpl<$Res>;
  $Res call(
      {double? power,
      double? rotation,
      String? deviceStatus,
      bool isConnected});
}

/// @nodoc
class _$Vector3CopyWithImpl<$Res> implements $Vector3CopyWith<$Res> {
  _$Vector3CopyWithImpl(this._value, this._then);

  final Vector3 _value;
  // ignore: unused_field
  final $Res Function(Vector3) _then;

  @override
  $Res call({
    Object? power = freezed,
    Object? rotation = freezed,
    Object? deviceStatus = freezed,
    Object? isConnected = freezed,
  }) {
    return _then(_value.copyWith(
      power: power == freezed
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as double?,
      rotation: rotation == freezed
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as double?,
      deviceStatus: deviceStatus == freezed
          ? _value.deviceStatus
          : deviceStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      isConnected: isConnected == freezed
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$Vector3CopyWith<$Res> implements $Vector3CopyWith<$Res> {
  factory _$Vector3CopyWith(_Vector3 value, $Res Function(_Vector3) then) =
      __$Vector3CopyWithImpl<$Res>;
  @override
  $Res call(
      {double? power,
      double? rotation,
      String? deviceStatus,
      bool isConnected});
}

/// @nodoc
class __$Vector3CopyWithImpl<$Res> extends _$Vector3CopyWithImpl<$Res>
    implements _$Vector3CopyWith<$Res> {
  __$Vector3CopyWithImpl(_Vector3 _value, $Res Function(_Vector3) _then)
      : super(_value, (v) => _then(v as _Vector3));

  @override
  _Vector3 get _value => super._value as _Vector3;

  @override
  $Res call({
    Object? power = freezed,
    Object? rotation = freezed,
    Object? deviceStatus = freezed,
    Object? isConnected = freezed,
  }) {
    return _then(_Vector3(
      power: power == freezed
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as double?,
      rotation: rotation == freezed
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as double?,
      deviceStatus: deviceStatus == freezed
          ? _value.deviceStatus
          : deviceStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      isConnected: isConnected == freezed
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Vector3 with DiagnosticableTreeMixin implements _Vector3 {
  const _$_Vector3(
      {this.power, this.rotation, this.deviceStatus, this.isConnected = false});

  @override
  final double? power;
  @override
  final double? rotation;
  @override
  final String? deviceStatus;
  @JsonKey()
  @override
  final bool isConnected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Vector3(power: $power, rotation: $rotation, deviceStatus: $deviceStatus, isConnected: $isConnected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Vector3'))
      ..add(DiagnosticsProperty('power', power))
      ..add(DiagnosticsProperty('rotation', rotation))
      ..add(DiagnosticsProperty('deviceStatus', deviceStatus))
      ..add(DiagnosticsProperty('isConnected', isConnected));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Vector3 &&
            const DeepCollectionEquality().equals(other.power, power) &&
            const DeepCollectionEquality().equals(other.rotation, rotation) &&
            const DeepCollectionEquality()
                .equals(other.deviceStatus, deviceStatus) &&
            const DeepCollectionEquality()
                .equals(other.isConnected, isConnected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(power),
      const DeepCollectionEquality().hash(rotation),
      const DeepCollectionEquality().hash(deviceStatus),
      const DeepCollectionEquality().hash(isConnected));

  @JsonKey(ignore: true)
  @override
  _$Vector3CopyWith<_Vector3> get copyWith =>
      __$Vector3CopyWithImpl<_Vector3>(this, _$identity);
}

abstract class _Vector3 implements Vector3 {
  const factory _Vector3(
      {double? power,
      double? rotation,
      String? deviceStatus,
      bool isConnected}) = _$_Vector3;

  @override
  double? get power;
  @override
  double? get rotation;
  @override
  String? get deviceStatus;
  @override
  bool get isConnected;
  @override
  @JsonKey(ignore: true)
  _$Vector3CopyWith<_Vector3> get copyWith =>
      throw _privateConstructorUsedError;
}
