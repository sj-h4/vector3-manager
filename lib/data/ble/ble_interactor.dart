import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vector3_manager_app/data/ble/ble_logger.dart';

import 'ble.dart';

final serviceDiscoverer = Provider<BleDeviceInteractor>((ref) {
  final _ble = ref.watch(ble);
  final _logMessage = ref.watch(bleLogger).addToLog;
  return BleDeviceInteractor(
    bleDiscoverServices: _ble.discoverServices,
    subscribeToCharacteristic: _ble.subscribeToCharacteristic,
    logMessage: _logMessage,
  );
});

class BleDeviceInteractor {
  BleDeviceInteractor({
    required Future<List<DiscoveredService>> Function(String deviceId)
        bleDiscoverServices,
    required void Function(String message) logMessage,
    required Stream<List<int>> Function(QualifiedCharacteristic characteristic)
        subscribeToCharacteristic,
  })  : _bleDiscoverServices = bleDiscoverServices,
        _subScribeToCharacteristic = subscribeToCharacteristic,
        _logMessage = logMessage;

  final Future<List<DiscoveredService>> Function(String deviceId)
      _bleDiscoverServices;

  final Stream<List<int>> Function(QualifiedCharacteristic characteristic)
      _subScribeToCharacteristic;

  final void Function(String message) _logMessage;

  Future<List<DiscoveredService>> discoverServices(String deviceId) async {
    try {
      _logMessage('Start discovering services for: $deviceId');
      final result = await _bleDiscoverServices(deviceId);
      _logMessage('Discovering services finished');
      return result;
    } on Exception catch (e) {
      _logMessage('Error occured when discovering services: $e');
      rethrow;
    }
  }

  Stream<List<int>> subScribeToCharacteristic(
      QualifiedCharacteristic characteristic) {
    _logMessage('Subscribing to: ${characteristic.characteristicId} ');
    return _subScribeToCharacteristic(characteristic);
  }
}
