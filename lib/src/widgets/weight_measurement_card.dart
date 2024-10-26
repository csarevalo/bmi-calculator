import 'package:bmi_calculator/src/constants/bmi_consts.dart';
import 'package:bmi_calculator/src/providers/bmi_provider.dart';
import 'package:bmi_calculator/src/widgets/measurement_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeightMeasurementCard extends StatelessWidget {
  const WeightMeasurementCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bmiProvider = Provider.of<BmiProvider>(context, listen: false);
    return Selector<BmiProvider, int>(
      selector: (_, p) => p.weight,
      builder: (_, weight, __) => MeasurementCard(
        title: 'WEIGHT',
        unit: 'lb',
        value: weight,
        max: kMaxWeight,
        min: kMinWeight,
        onUpdateValue: bmiProvider.updateWeight,
      ),
    );
  }
}
