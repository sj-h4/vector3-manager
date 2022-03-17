import 'widgets.dart';
import '../controllers/vector3_controller.dart';

class Rotation extends HookConsumerWidget {
  const Rotation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rotation = ref.watch(vector3ControllerProvider).rotation;
    return Text(
      'rotation: $rotation',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
