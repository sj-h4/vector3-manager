import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/entities/vector3.dart';
import '../../data/repositories/vector3_repository.dart';

final vector3ControllerProvider =
    StateNotifierProvider<Vector3Controller, Vector3>(
        (ref) => Vector3Controller());

class Vector3Controller extends StateNotifier<Vector3> {
  Vector3Controller()
      : super(const Vector3(
          power: 0,
          rotation: 0,
          deviceStatus: "waiting",
          isConnected: false,
        ));

  final Vector3Repository _vector3repository = Vector3Repository();

  void getVector3Data() {
    _vector3repository.vector3StreamController.stream.listen((event) {
      state = state.copyWith(
        power: event.power,
        rotation: event.rotation,
        deviceStatus: event.deviceStatus,
        isConnected: event.isConnected,
      );
    });
    _vector3repository.startScan();
  }

  void disconnectVector3() {
    _vector3repository.disconnectDevice();
  }
}
