import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'vector3.freezed.dart';

@freezed
class Vector3 with _$Vector3 {
  const factory Vector3({
    double? power,
    double? rotation,
    String? deviceStatus,
    @Default(false) bool isConnected,
  }) = _Vector3;
}
