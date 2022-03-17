import 'widgets.dart';
import '../controllers/vector3_controller.dart';

class Power extends HookConsumerWidget {
  const Power({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final power = ref.watch(vector3ControllerProvider).power;
    return Text(
      'power: $power',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
