import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vector3_manager_app/data/ble/ble_connector.dart';
import 'package:vector3_manager_app/data/ble/ble_scanner.dart';

import '../../data/entities/vector3.dart';
import '../../data/repositories/vector3_repository.dart';

final vector3connection = StreamProvider((ref) {
  ref
      .watch(bleScanner)
      .startScan([Uuid.parse("00001818-0000-1000-8000-00805f9b34fb")]);
  ref.watch(scanResultProvider).listen((scanResult) {
    final DiscoveredDevice? vector3 = scanResult.discoveredDevices
        .firstWhere((device) => device.name == "V3 BLE:0442838");
    ref.watch(bleConnector).connect(vector3!.id);
  });
  return ref.watch(connectorProvider);
});

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
