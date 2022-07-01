import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:async';

import '../entities/vector3.dart';
import '../entities/vector3_profile.dart';

abstract class Vector3RepositoryInterface {
  Vector3RepositoryInterface() : super();

  final vector3StreamController = StreamController<Vector3>.broadcast();
  Vector3 vector3 = const Vector3(deviceStatus: "waiting", isConnected: false);
  final String deviceName = Vector3NameProfile.vector3Name;
  final String serviceUUID = Vector3ServicesProfile.vector3Service;
  final String charactaristicUUID =
      Vector3CharacteristicProfile.vector3Characteristic;
  FlutterBlue flutterBlue = FlutterBlue.instance;

  double power = 0;
  double rotation = 0;
  int prevRev = 0;
  int prevTime = 0;

  Future<void> dispose() async {
    vector3StreamController.close();
  }

  Future<void> disconnectDevice();

  void startScan();

  void connectToDevice();

  void discoverServices();
  void recieveNotification();

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
