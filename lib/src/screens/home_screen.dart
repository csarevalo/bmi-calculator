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

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({
    super.key,
  });

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  Gender selectedGender = Gender.none;
  double height = 150; //cm
  int weight = 130; //lb
  int age = 30; //years

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              GenderCard(
                gender: Gender.male,
                selected: selectedGender == Gender.male,
                onTap: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
              ),
              const Spacer(),
              GenderCard(
                gender: Gender.female,
                selected: selectedGender == Gender.female,
                onTap: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
              ),
            ],
          ),
        ),
        const HeightSliderCard(
          initValue: 110,
          max: 225,
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
