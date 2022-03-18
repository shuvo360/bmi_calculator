import 'package:flutter/material.dart';
import 'dart:math';

class CalculateBrain {
  CalculateBrain({required this.hight, required this.weight});

  final int hight;
  final int weight;

  double _bmi = 0;

  String getCalculate() {
    _bmi = weight / pow(hight / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getStatus() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.3) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getMassege() {
    if (_bmi >= 25) {
      return 'Take Fast more and more.';
    } else if (_bmi >= 18) {
      return 'Very good helth, keep maintain.';
    } else {
      return 'Eat 6 times per day to gain weight.';
    }
  }
}