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
          ref.read(vector3ControllerProvider.notifier).getVector3Data();
        }
      },
    );
  }
}
