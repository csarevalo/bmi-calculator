import 'package:bmi_calculator/src/providers/bmi_provider.dart';
import 'package:bmi_calculator/src/widgets/gender_card.dart';
import 'package:bmi_calculator/src/widgets/height_slider_card.dart';
import 'package:bmi_calculator/src/widgets/measurement_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        elevation: 0.65,
      ),
      body: const HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bmiProvider = Provider.of<BmiProvider>(context, listen: false);
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Selector<BmiProvider, Gender>(
                selector: (_, p) => p.gender,
                builder: (_, gender, __) => GenderCard(
                  gender: Gender.male,
                  selected: gender == Gender.male,
                  onTap: () {
                    bmiProvider.updateGender(Gender.male);
                  },
                ),
              ),
              const Spacer(),
              Selector<BmiProvider, Gender>(
                selector: (_, p) => p.gender,
                builder: (_, gender, __) => GenderCard(
                  gender: Gender.female,
                  selected: gender == Gender.female,
                  onTap: () {
                    bmiProvider.updateGender(Gender.female);
                  },
                ),
              ),
            ],
          ),
        ),
        const HeightSliderCard(
          initValue: 165, //5ft 4in
          max: 256, //8ft 4in
          min: 1,
          unit: 'cm',
        ),
        const Expanded(
          child: Row(
            children: [
              MeasurementCard(
                title: 'WEIGHT',
                unit: 'lb',
                initValue: 130,
                maxValue: 500,
                minValue: 1,
              ),
              Spacer(),
              MeasurementCard(
                title: 'AGE',
                initValue: 30,
                maxValue: 130,
                minValue: 1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
