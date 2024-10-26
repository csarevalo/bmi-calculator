import 'package:bmi_calculator/src/constants/bmi_consts.dart';
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
    return Column(
      children: [
        const Expanded(
          child: Row(
            children: [
              GenderCard(gender: Gender.male),
              Spacer(),
              GenderCard(gender: Gender.female)
            ],
          ),
        ),
        const HeightSliderCard(
          initValue: 165, //5ft 4in
          max: kMaxHeight,
          min: kMinHeight,
          unit: 'cm',
        ),
        Expanded(
          child: Row(
            children: [
              Selector<BmiProvider, int>(
                selector: (_, p) => p.weight,
                builder: (_, weight, __) => MeasurementCard(
                  title: 'WEIGHT',
                  unit: 'lb',
                  value: weight,
                  max: kMaxWeight,
                  min: kMinWeight,
                ),
              ),
              const Spacer(),
              Selector<BmiProvider, int>(
                selector: (_, p) => p.age,
                builder: (_, age, __) => MeasurementCard(
                  title: 'AGE',
                  value: age,
                  max: kMaxAge,
                  min: kMinAge,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
