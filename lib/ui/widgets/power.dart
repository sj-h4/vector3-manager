import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'widgets.dart';
import '../controllers/vector3_controller.dart';

class Power extends HookConsumerWidget {
  const Power({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final power = ref.watch(vector3ControllerProvider).power;
    return Center(
        child: SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(minimum: 0, maximum: 500, pointers: <GaugePointer>[
          RangePointer(
            value: power,
            width: 20,
            color: Colors.teal,
          ),
        ], annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              angle: 90,
              positionFactor: 0.5,
              widget: Text(
                '${(power).toStringAsFixed(1)} W',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ))
        ])
      ],
    ));
  }
}
