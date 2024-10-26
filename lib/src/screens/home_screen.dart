import 'package:bmi_calculator/src/widgets/gender_card.dart';
import 'package:bmi_calculator/src/widgets/height_slider_card.dart';
import 'package:bmi_calculator/src/widgets/measurement_card.dart';
import 'package:flutter/material.dart';

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
    return const Column(
      children: [
        Expanded(
          child: Row(
            children: [
              GenderCard(gender: Gender.male),
              Spacer(),
              GenderCard(gender: Gender.female)
            ],
          ),
        ),
        HeightSliderCard(
          initValue: 165, //5ft 4in
          max: 256, //8ft 4in
          min: 1,
          unit: 'cm',
        ),
        Expanded(
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
