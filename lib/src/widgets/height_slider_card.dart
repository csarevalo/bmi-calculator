import 'package:flutter/material.dart';

class HeightSliderCard extends StatefulWidget {
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
  State<HeightSliderCard> createState() => _HeightSliderCardState();
}

class _HeightSliderCardState extends State<HeightSliderCard> {
  late double _sliderValue;

  @override
  void initState() {
    super.initState();
    _sliderValue = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
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
                Text(
                  _sliderValue.toStringAsFixed(0),
                  textAlign: TextAlign.center,
                  style: numStyle,
                ),
                Text(widget.unit, style: titleStyle)
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
              child: Slider(
                  value: _sliderValue,
                  max: widget.max,
                  min: widget.min,
                  onChanged: (newVal) {
                    // TODO: Update height in app provider
                    setState(() {
                      _sliderValue = newVal;
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
