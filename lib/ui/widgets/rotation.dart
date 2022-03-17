import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'widgets.dart';
import '../controllers/vector3_controller.dart';

class Rotation extends HookConsumerWidget {
  const Rotation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rotation = ref.watch(vector3ControllerProvider).rotation;
    return Center(
        child: SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(minimum: 60, maximum: 150, pointers: <GaugePointer>[
          RangePointer(
            value: rotation!,
            width: 20,
            color: Colors.teal,
          ),
        ], annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              angle: 90,
              positionFactor: 0.5,
              widget: Text(
                '${(rotation).toStringAsFixed(1)} rpm',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ))
        ])
      ],
    ));
  }
}
