import 'package:bmi_calculator/src/constants/bmi_consts.dart';
import 'package:bmi_calculator/src/widgets/age_measurement_card.dart';
import 'package:bmi_calculator/src/widgets/bmi_app_bar.dart';
import 'package:bmi_calculator/src/widgets/bottom_app_button.dart';
import 'package:bmi_calculator/src/widgets/gender_card.dart';
import 'package:bmi_calculator/src/widgets/height_slider_card.dart';
import 'package:bmi_calculator/src/widgets/weight_measurement_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BmiAppBar(),
      body: SafeArea(
        child: HomeScreenContent(),
      ),
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
        const Expanded(
          child: Row(
            children: [
              WeightMeasurementCard(),
              Spacer(),
              AgeMeasurementCard(),
            ],
          ),
        ),
        BottomAppButton(
          title: 'Calculate',
          onPressed: () => Navigator.pushNamed(context, '/calc'),
        )
      ],
    );
  }
}
