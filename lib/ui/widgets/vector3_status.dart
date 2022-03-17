import 'widgets.dart';
import '../controllers/vector3_controller.dart';

class Vector3Status extends HookConsumerWidget {
  const Vector3Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceStatus = ref.watch(vector3ControllerProvider).deviceStatus;
    return Text(
      '$deviceStatus',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
