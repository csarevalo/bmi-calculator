import 'package:bmi_calculator/src/widgets/bmi_app_bar.dart';
import 'package:bmi_calculator/src/widgets/bottom_app_button.dart';
import 'package:flutter/material.dart';

class CalcScreen extends StatelessWidget {
  const CalcScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BmiAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Text(
                  'Results',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
            ),
          ),
          BottomAppButton(
            title: 'Re-Calculate',
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
