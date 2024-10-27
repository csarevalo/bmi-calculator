import 'package:bmi_calculator/src/constants/bmi_consts.dart';
import 'package:bmi_calculator/src/providers/bmi_provider.dart';
import 'package:bmi_calculator/src/widgets/bmi_app_bar.dart';
import 'package:bmi_calculator/src/widgets/bottom_app_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalcScreen extends StatelessWidget {
  const CalcScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bmiProvider = Provider.of<BmiProvider>(context, listen: false);
    //BMI CALCULATIONS
    final double weight = kLbToKg * bmiProvider.weight; //kg's
    final double height = kCmToM * bmiProvider.height; //m's
    final double bmi = weight / height / height;
    //DETERMINE RESULTS
    final String results = _getBmiResults(bmi).text;
    //STYLES
    final TextTheme textTheme = Theme.of(context).textTheme;

    final TextStyle resTitleStyle = textTheme.displayMedium!.copyWith(
      // color: Theme.of(context).colorScheme.onPrimaryContainer,
      fontSize: 42,
    );

    final TextStyle resStyle = textTheme.bodyLarge!.copyWith(
      fontWeight: FontWeight.lerp(FontWeight.normal, FontWeight.bold, 0.5),
      fontSize: 28,
      // color: Theme.of(context).colorScheme.tertiary,
      color: Colors.green,
    );

    final TextStyle bigNumStyle = textTheme.displayMedium!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 64,
    );

    return Scaffold(
      appBar: const BmiAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 8.0),
            child: Text(
              'Your Results',
              textAlign: TextAlign.left,
              style: resTitleStyle,
            ),
          ),
          Expanded(
            flex: 7,
            child: Card(
              margin: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(results, style: resStyle),
                  Text(
                    bmi.toStringAsFixed(2),
                    style: bigNumStyle,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100.0),
                    child: Text(
                      'Obesity is on the rise. Please take care of yourself.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          BottomAppButton(
            title: 'Re-Calculate'.toUpperCase(),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

_BmiForAdults _getBmiResults(double bmi) {
  final _BmiForAdults res;
  if (bmi < _BmiForAdults.severeThinness.maxBmi) {
    res = _BmiForAdults.severeThinness;
  } else if (bmi < _BmiForAdults.moderateThinness.maxBmi) {
    res = _BmiForAdults.moderateThinness;
  } else if (bmi < _BmiForAdults.mildThinness.maxBmi) {
    res = _BmiForAdults.mildThinness;
  } else if (bmi < _BmiForAdults.normal.maxBmi) {
    res = _BmiForAdults.normal;
  } else if (bmi < _BmiForAdults.overWeight.maxBmi) {
    res = _BmiForAdults.overWeight;
  } else if (bmi < _BmiForAdults.obeseI.maxBmi) {
    res = _BmiForAdults.obeseI;
  } else if (bmi < _BmiForAdults.obeseII.maxBmi) {
    res = _BmiForAdults.obeseII;
  } else {
    res = _BmiForAdults.obeseIII;
  }
  return res;
}

enum _BmiForAdults implements Comparable<_BmiForAdults> {
  severeThinness(id: 0, text: 'Severe Thinness', maxBmi: 16, minBmi: 0),
  moderateThinness(id: 1, text: 'Moderate Thinness', maxBmi: 17, minBmi: 16),
  mildThinness(id: 2, text: 'Mild Thinness', maxBmi: 18.5, minBmi: 17),
  normal(id: 3, text: 'Normal', maxBmi: 25, minBmi: 18.5),
  overWeight(id: 4, text: 'Obese I', maxBmi: 30, minBmi: 25),
  obeseI(id: 5, text: 'Obese I', maxBmi: 35, minBmi: 30),
  obeseII(id: 6, text: 'Obese II', maxBmi: 40, minBmi: 35),
  obeseIII(id: 8, text: 'Obese III', maxBmi: double.infinity, minBmi: 40);

  const _BmiForAdults({
    required this.id,
    required this.text,
    required this.maxBmi,
    required this.minBmi,
  });

  final int id;
  final String text;
  final double maxBmi;
  final double minBmi;

  @override
  int compareTo(_BmiForAdults other) => id - other.id;
}
