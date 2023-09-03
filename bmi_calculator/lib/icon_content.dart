import 'package:bmi_calculator/design.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IconContent extends StatelessWidget {
  IconContent({super.key, required this.icon, required this.text});

  String text;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 25,
        ),
        Text(text, style: kmainTextStyle),
      ],
    );
  }
}
