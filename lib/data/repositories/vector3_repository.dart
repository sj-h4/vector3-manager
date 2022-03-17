import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:async';

import '../entities/vector3.dart';
import '../entities/vector3_profile.dart';

class Vector3Repository {
  Vector3Repository() : super();

  final vector3StreamController = StreamController<Vector3>.broadcast();
  Vector3 vector3 = const Vector3(deviceStatus: "waiting", isConnected: false);
  final String deviceName = Vector3NameProfile.vector3Name;
  final String serviceUUID = Vector3ServicesProfile.vector3Service;
  final String charactaristicUUID =
      Vector3CharacteristicProfile.vector3Characteristic;
  FlutterBlue flutterBlue = FlutterBlue.instance;
  late BluetoothDevice targetDevice;
  late BluetoothCharacteristic bleCharactaristic;

  double power = 0;
  double rotation = 0;
  int prevRev = 0;
  int prevTime = 0;

  Future<void> dispose() async {
    vector3StreamController.close();
  }

  Future<void> disconnectDevice() async {
    vector3 = vector3.copyWith(deviceStatus: "waiting", isConnected: false);
    if (!vector3StreamController.isClosed) {
      vector3StreamController.sink.add(vector3);
    }
    targetDevice.disconnect();
    flutterBlue.stopScan();
    debugPrint("disconnected");
  }

  void startScan() {
    flutterBlue.startScan(timeout: const Duration(seconds: 4));
    debugPrint("deviceStatus: connecting");
    vector3 = vector3.copyWith(deviceStatus: "scanning", isConnected: false);
    if (!vector3StreamController.isClosed) {
      vector3StreamController.sink.add(vector3);
    }
    // Listen to scan results
    flutterBlue.scanResults.listen(
      (results) {
        // do something with scan results
        for (ScanResult r in results) {
          debugPrint(r.device.name);
          if (r.device.name == deviceName) {
            targetDevice = r.device;
            connectToDevice();
            flutterBlue.stopScan();
            break;
          }
        }
      },
    );
  }

  void connectToDevice() async {
    await targetDevice.connect();
    discoverServices();
  }

  void discoverServices() async {
    debugPrint("discovering");
    List<BluetoothService> services = await targetDevice.discoverServices();
    for (BluetoothService s in services) {
      debugPrint("service UUID: $s.uuid.toString");
      if (s.uuid.toString() == serviceUUID) {
        for (var charactaristic in s.characteristics) {
          debugPrint("cahractaristic UUID: $charactaristic.uuid.toString()");

          if (charactaristic.uuid.toString() == charactaristicUUID) {
            bleCharactaristic = charactaristic;
            vector3 = vector3.copyWith(
              deviceStatus: "Connected: ${targetDevice.name}",
              isConnected: true,
            );
            if (!vector3StreamController.isClosed) {
              vector3StreamController.sink.add(vector3);
            }
            recieveNotification();
          } else {
            debugPrint("cannot");
          }
          debugPrint("connected service");
        }
      }
    }
  }

  void recieveNotification() async {
    await bleCharactaristic.setNotifyValue(true);
    bleCharactaristic.value.listen((value) async {
      bleRaw2Vector3(value);
    });
  }

  void bleRaw2Vector3(value) {
    power = (value[3] * 256 + value[2]).toDouble();
    vector3 = vector3.copyWith(power: power);
    if (!vector3StreamController.isClosed) {
      vector3StreamController.sink.add(vector3);
    }

    int rev = value[6] * 256 + value[5];
    int time = value[8] * 256 + value[7];
    debugPrint("rev: $rev \n time: $time");

    int dr = rev - prevRev;
    int dt = time - prevTime;
    debugPrint("drev: $dr \n dtime: $dt");

    if (dt != 0) {
      rotation = dr * 1024 * 60 / dt;
      vector3 = vector3.copyWith(rotation: rotation);
      if (!vector3StreamController.isClosed) {
        vector3StreamController.sink.add(vector3);
      }
    }
    prevRev = rev;
    prevTime = time;
  }
}
