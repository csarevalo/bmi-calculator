import 'package:bmi_calculator/src/providers/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeightSliderCard extends StatelessWidget {
  const HeightSliderCard({
    super.key,
    required this.initValue,
    required this.unit,
    required this.max,
    required this.min,
  });

  final double initValue;
  final String unit;
  final double max;
  final double min;

  @override
  Widget build(BuildContext context) {
    final bmiProvider = Provider.of<BmiProvider>(context, listen: false);
    final TextStyle titleStyle =
        Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.lerp(
                FontWeight.normal,
                FontWeight.bold,
                0.5,
              ),
            );
    final TextStyle numStyle =
        Theme.of(context).textTheme.displayMedium!.copyWith(
              fontWeight: FontWeight.bold,
            );
    return Expanded(
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'HEIGHT',
              textAlign: TextAlign.center,
              style: titleStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Selector<BmiProvider, double>(
                  selector: (_, p) => p.height,
                  builder: (_, height, __) {
                    return Text(
                      height.toStringAsFixed(0),
                      textAlign: TextAlign.center,
                      style: numStyle,
                    );
                  },
                ),
                Text(unit, style: titleStyle)
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  trackHeight: 3.0,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 14),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 24),
                  activeTrackColor: Colors.red[700],
                  thumbColor: Colors.red[700]),
              child: Selector<BmiProvider, double>(
                selector: (_, p) => p.height,
                builder: (_, height, __) {
                  return Slider(
                    value: height,
                    max: max,
                    min: min,
                    onChanged: (newHeight) {
                      bmiProvider.updateHeight(newHeight);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
