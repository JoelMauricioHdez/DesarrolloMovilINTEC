import 'dart:math';

import 'package:flutter/material.dart';

enum Category {
  obesity(
    "Obesity",
    Colors.red,
    "In case of confirmation of this results it is crucial to adopt a healthier diet full of nutrient rich foods such as vegetables, whole grains, fruits, etc. It is also important to incorporate an exercise routine or some type of physical activity for at least 30 minutes, 3 times a week.",
    RangeValues(30.0, 32.5),
  ),
  overweight(
    "Overweight",
    Colors.deepOrange,
    "In a general sense, it is important to adopt a healthy diet consisting of fruits, vegetables, grains and more. You should also keep yourself hydrated specially because, the diet should be followed with the incorporation of an exercise routine or some type of physical activity for at least 30 minutes, 3 times a week.",
    RangeValues(25.1, 29.9),
  ),
  normal(
    "Normal",
    Colors.green,
    "Even though it seems that you are between a healthy range, according to the BMI calculation, it is still important to incorporate a balanced diet and exercise on a day-to-day basis to maintain and promote good health. Don't forget to drink water and keep yourself hydrated.",
    RangeValues(18.5, 25),
  ),
  underweight(
    "Underweight",
    Colors.red,
    "It is important to understand your daily caloric needs to achieve a healthy weight gain. Please consult with a Healthcare Professional so that any underlying cause can be addressed, and to also get help for what diet to follow.",
    RangeValues(16, 18.5),
  );

  final String name;
  final Color color;
  final String advice;
  final RangeValues range;
  const Category(this.name, this.color, this.advice, this.range);
}

class Calculator {
  final weight;
  final height;

  double bmi = 0;

  Calculator(this.weight, this.height);

  String calculateBMI() {
    bmi = weight / pow(height / 100.0, 2.0);
    return bmi.toStringAsFixed(2);
  }

  static Category getBMICategory(double bmi) {
    if (bmi >= 18.5) {
      if (bmi >= 25) {
        if (bmi >= 30) {
          return Category.obesity;
        }
        return Category.overweight;
      }
      return Category.normal;
    }
    return Category.underweight;
  }
}
