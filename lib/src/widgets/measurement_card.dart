import 'package:flutter/material.dart';

class MeasurementCard extends StatelessWidget {
  const MeasurementCard({
    super.key,
    required this.title,
    this.unit = '',
    required this.value,
    required this.max,
    required this.min,
    this.onAdd,
    this.onRemove,
  });
  
  final String title;
  final String unit;
  final int value;
  final int max;
  final int min;
  final void Function()? onAdd;
  final void Function()? onRemove;

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
              title,
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
                  unit,
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
                    onPressed: value <= min ? null : onRemove,
                    // : () {
                    //     setState(() {
                    //       if (value > widget.min) value--;
                    //     });
                    //   },
                    icon: const Icon(
                      Icons.remove,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  IconButton.filledTonal(
                    onPressed: value >= max ? null : onAdd,
                    // : () {
                    //     setState(() {
                    //       if (value < widget.max) value++;
                    //     });
                    //   },
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
