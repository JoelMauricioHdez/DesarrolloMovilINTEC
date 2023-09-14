import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/design.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultsPage extends StatelessWidget {
  ResultsPage({super.key, required this.bmi});

  String bmi;

  @override
  Widget build(BuildContext context) {
    final Category bmiCategory = Calculator.getBMICategory(double.parse(bmi));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Summary"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'BMI result',
                        style: kmainTextStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            bmi,
                            style: kMainButtonStyle,
                          ),
                          Text(
                            ' bmi',
                            style: kMainButtonStyle.copyWith(fontSize: 18),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'BMI category',
                        style: kmainTextStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        bmiCategory.name,
                        style:
                            kMainButtonStyle.copyWith(color: bmiCategory.color),
                      ), // resultado del bmi
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('18.5 <'),
                    Text('25'),
                    Text('> 30'),
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(
                    valueIndicatorColor: bmiCategory.color,
                    overlayShape: SliderComponentShape.noOverlay,
                    thumbShape: SliderComponentShape.noThumb,
                  ),
                  child: RangeSlider(
                      divisions: 4,
                      activeColor: bmiCategory.color,
                      labels: bmiCategory == Category.obesity
                          ? const RangeLabels('30', '>')
                          : bmiCategory == Category.underweight
                              ? const RangeLabels('<', '18.5')
                              : RangeLabels(
                                  '${bmiCategory.range.start}',
                                  '${bmiCategory.range.end}',
                                ),
                      min: 16,
                      max: 32.5,
                      values: bmiCategory.range,
                      onChanged: (values) {}),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Suggestions',
                  style: kmainTextStyle,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      bmiCategory.advice,
                      textAlign: TextAlign.justify,
                      style: kMainButtonStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    'DISCLAIMER: The BMI calculations are not the best way to get a definitive judgement on your health state. Please consult a Healthcare Professional for more accurate results',
                    style: kmainTextStyle.copyWith(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
