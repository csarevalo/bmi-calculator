import 'package:flutter/material.dart';

class MeasurementCard extends StatefulWidget {
  const MeasurementCard({
    super.key,
    required this.title,
    this.unit = '',
    required this.initValue,
    required this.max,
    required this.min,
  });
  final String title;
  final String unit;
  final int initValue;
  final int max;
  final int min;

  @override
  State<MeasurementCard> createState() => _MeasurementCardState();
}

class _MeasurementCardState extends State<MeasurementCard> {
  late int value;

  int get currentValue => value;

  @override
  void initState() {
    super.initState();
    value = widget.initValue;
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
      flex: 15,
      child: Card(
        margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: titleStyle,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value.toString(),
                  textAlign: TextAlign.center,
                  style: numStyle,
                ),
                Text(
                  widget.unit,
                  style: titleStyle,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton.filledTonal(
                    onPressed: () {
                      setState(() {
                        if (value > widget.min) value--;
                      });
                    },
                    icon: const Icon(
                      Icons.remove,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  IconButton.filledTonal(
                    onPressed: () {
                      setState(() {
                        if (value < widget.max) value++;
                      });
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
