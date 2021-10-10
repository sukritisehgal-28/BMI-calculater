import 'package:flutter/material.dart';
import 'dart:math';

class Calculation {
  Calculation({@required this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    double _bmi = weight / pow(2,height/100);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }


  String getInterpretation() {
    if (_bmi >= 25.0) {
      return 'you have a higher than normal body weight. Exercise more';
    } else if (_bmi >= 18.5) {
      return 'you have normal body weight. YAYAY';
    } else {
      return 'you have lower than normal body weight. Eat more!';
    }
  }
}