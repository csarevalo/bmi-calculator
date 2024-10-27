import 'package:bmi_calculator/src/constants/bmi_consts.dart';
import 'package:bmi_calculator/src/widgets/age_measurement_card.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        elevation: 0.65,
      ),
      body: const SafeArea(
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
    final TextStyle titleStyle =
        Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.lerp(
              FontWeight.normal,
              FontWeight.bold,
              0.5,
            ),
            fontSize: 25);
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MaterialButton(
              onPressed: () {},
              color: Colors.red[900],
              shape: const ContinuousRectangleBorder(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                child: Text('Calculate', style: titleStyle),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
