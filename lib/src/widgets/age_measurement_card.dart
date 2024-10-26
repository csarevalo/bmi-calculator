import 'package:bmi_calculator/src/constants/bmi_consts.dart';
import 'package:bmi_calculator/src/providers/bmi_provider.dart';
import 'package:bmi_calculator/src/widgets/measurement_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgeMeasurementCard extends StatelessWidget {
  const AgeMeasurementCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bmiProvider = Provider.of<BmiProvider>(context, listen: false);
    return Selector<BmiProvider, int>(
      selector: (_, p) => p.age,
      builder: (_, age, __) => MeasurementCard(
        title: 'AGE',
        value: age,
        max: kMaxAge,
        min: kMinAge,
        onUpdateValue: bmiProvider.updateAge,
      ),
    );
  }
}
