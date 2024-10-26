import 'package:bmi_calculator/src/constants/bmi_consts.dart';
import 'package:bmi_calculator/src/widgets/gender_card.dart';
import 'package:flutter/material.dart';

class BmiProvider extends ChangeNotifier {
  // Set private BMI variables
  Gender _gender = Gender.none;
  double _height = kInitHeight; //cm
  int _weight = kInitWeight; //lb
  int _age = kInitAge; //years

  // Get BMI parameters from private variables
  Gender get gender => _gender;
  double get height => _height;
  int get weight => _weight;
  int get age => _age;

  /// Update user gender
  void updateGender(Gender newGender) {
    _gender = newGender;
    notifyListeners();
  }

  /// Update user [height]
  void updateHeight(double newHeight) {
    if (_height > kMinHeight || _height < kMaxHeight) {
      _height = newHeight;
      notifyListeners();
    }
  }

  /// Update user [weight]
  void updateWeight(int newWeight) {
    if (_weight > kMinWeight || _weight < kMaxWeight) {
      _weight = newWeight;
      notifyListeners();
    }
  }

  /// Update user [age]
  void updateAge(int newAge) {
    if (_age > kMinAge || _age < kMaxAge) {
      _age = newAge;
      notifyListeners();
    }
  }
}
