import 'package:bmi_calculator/src/widgets/gender_card.dart';
import 'package:flutter/material.dart';

class BmiProvider extends ChangeNotifier {
  Gender _gender = Gender.none;
  double _height = 165; //cm
  double _weight = 130; //lb
  int _age = 30; //years

  /// Update user gender
  void updateGender(Gender newGender) {
    _gender = newGender;
    notifyListeners();
  }

  /// Update user [height]
  void updateHeight(double newHeight) {
    _height = newHeight;
    notifyListeners();
  }

  /// Update user [weight]
  void updateWeight(double newWeight) {
    _weight = newWeight;
    notifyListeners();
  }

  /// Update user [age]
  void updateAge(int newAge) {
    _age = newAge;
    notifyListeners();
  }
}
