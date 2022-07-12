import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:vector3_manager_app/data/ble/ble_connector.dart';
import 'package:vector3_manager_app/data/ble/ble_scanner.dart';

import 'widgets.dart';
import '../controllers/vector3_controller.dart';

class Vector3Button extends HookConsumerWidget {
  const Vector3Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = ref.watch(vector3ControllerProvider).isConnected;
    return ElevatedButton(
      child: const Text('connect'),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        onPrimary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        if (isConnected) {
          ref.read(vector3ControllerProvider.notifier).disconnectVector3();
        } else {
          ref
              .watch(bleScanner)
              .startScan([Uuid.parse("00001818-0000-1000-8000-00805f9b34fb")]);
          ref.watch(scanResultProvider).listen((scanResult) {
            final DiscoveredDevice? vector3 = scanResult.discoveredDevices
                .firstWhere((device) => device.name == "V3 BLE:0442838");
            ref.watch(bleConnector).connect(vector3!.id);
          });
        }
      },
    );
  }
}
