import 'package:flutter/material.dart';

class BottomAppButton extends StatelessWidget {
  const BottomAppButton({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle resultStyle = textTheme.bodyLarge!.copyWith(
      fontWeight: FontWeight.lerp(
        FontWeight.normal,
        FontWeight.bold,
        0.5,
      ),
      fontSize: 25,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          disabledColor: colorScheme.errorContainer,
          color: colorScheme.errorContainer,
          shape: const ContinuousRectangleBorder(),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            child: Text(title, style: resultStyle),
          ),
        ),
      ],
    );
  }
}
