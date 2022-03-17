import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'timer.freezed.dart';

@freezed
class Timer with _$Timer {
  const factory Timer({
    @Default(false) bool isStarted,
  }) = _Timer;
}
