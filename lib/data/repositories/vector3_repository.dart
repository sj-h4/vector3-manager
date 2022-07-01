import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:vector3_manager_app/data/repositories/vector3_repository_interface.dart';

import '../entities/vector3.dart';

class Vector3Repository extends Vector3RepositoryInterface {
  Vector3Repository() : super();

  final FlutterReactiveBle ble = FlutterReactiveBle();
  late DiscoveredDevice targetDevice;
  late QualifiedCharacteristic bleCharactaristic;

  @override
  void startScan() async {
    targetDevice = await ble.scanForDevices(
        withServices: [],
        scanMode:
            ScanMode.lowLatency).firstWhere(
        (device) => device.name == super.deviceName);
  }

  @override
  void connectToDevice() {
    ble
        .connectToAdvertisingDevice(
      id: targetDevice.id,
      withServices: [Uuid.parse(super.serviceUUID)],
      prescanDuration: const Duration(seconds: 5),
      connectionTimeout: const Duration(seconds: 4),
    )
        .listen((connectionState) {
      // Handle connection state updates
    });
  }

  @override
  Future<void> disconnectDevice() {
    // TODO: implement disconnectDevice
    throw UnimplementedError();
  }

  @override
  void discoverServices() {
    // TODO: implement discoverServices
  }

  @override
  void recieveNotification() {
    // TODO: implement recieveNotification
  }
}
