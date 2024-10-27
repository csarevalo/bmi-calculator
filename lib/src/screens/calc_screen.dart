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
    final String results = getBmiResults(bmi);
    //STYLES
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle resStyle = textTheme.bodyLarge!.copyWith(
      fontWeight: FontWeight.lerp(FontWeight.normal, FontWeight.bold, 0.5),
      fontSize: 36,
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
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 8.0, 6.0),
            child: Text(
              'Your Results',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 42,
                  ),
            ),
          ),
          Expanded(
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
                ],
              ),
            ),
          ),
          BottomAppButton(
            title: 'Re-Calculate'.toUpperCase(),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

String getBmiResults(double bmi) {
  final String res;
  if (bmi < 16) {
    res = 'Severe Thinness';
  } else if (bmi < 17) {
    res = 'Moderate Thinness';
  } else if (bmi < 18.5) {
    res = 'Mild Thinness';
  } else if (bmi < 25) {
    res = 'Normal';
  } else if (bmi < 30) {
    res = 'Overweight';
  } else if (bmi < 35) {
    res = 'Obese I';
  } else if (bmi < 40) {
    res = 'Obese II';
  } else {
    res = 'Obese III';
  }
  return res;
}
