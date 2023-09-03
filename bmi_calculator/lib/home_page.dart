import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/card_widget.dart';
import 'package:bmi_calculator/design.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

const Color kcardColor = Color(0xFF111328); //kInactiveColor
const Color kActiveCardColor = Color(0xFF1D1E33);

enum Gender {
  male("MALE", Color(0xFF3f60a8)),
  female("FEMALE", Colors.pink);

  final String value;
  final Color color;
  const Gender(this.value, this.color);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender? selectedGender;
  int height = 120;
  int weight = 120;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardWidget(
                    action: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? Gender.male.color
                        : kcardColor,
                    cardContent: IconContent(
                        icon: FontAwesomeIcons.mars, text: Gender.male.value),
                  ),
                ),
                Expanded(
                  child: CardWidget(
                    action: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? Gender.female.color
                        : kcardColor,
                    cardContent: IconContent(
                        icon: FontAwesomeIcons.venus,
                        text: Gender.female.value),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardWidget(
              action: () {},
              color: kcardColor,
              cardContent: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "HEIGHT",
                    style: kmainTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height',
                        style: const TextStyle(
                          fontSize: 50.0,
                        ),
                      ),
                      Text(
                        ' cm',
                        style: kmainTextStyle.copyWith(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    min: 100.0,
                    max: 220.0,
                    value: height.toDouble(),
                    onChanged: (newHeight) {
                      setState(() {
                        height = newHeight.toInt();
                      });
                    },
                    activeColor: selectedGender == null
                        ? SliderTheme.of(context).activeTrackColor
                        : selectedGender == Gender.male
                            ? Gender.male.color
                            : Gender.female.color,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardWidget(
                    action: () {},
                    color: kcardColor,
                    cardContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kmainTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '$weight',
                              style: const TextStyle(
                                fontSize: 50.0,
                              ),
                            ),
                            Text(
                              ' kg',
                              style: kmainTextStyle.copyWith(
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.white,
                              foregroundColor: kActiveCardColor,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10)),
                              // ignore: deprecated_member_use
                              child: const Icon(FontAwesomeIcons.add),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.white,
                              foregroundColor: kActiveCardColor,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              // ignore: deprecated_member_use
                              child: const Icon(FontAwesomeIcons.subtract),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardWidget(
                    action: () {},
                    color: kcardColor,
                    cardContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kmainTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '$age',
                              style: const TextStyle(
                                fontSize: 50.0,
                              ),
                            ),
                            Text(
                              ' yrs',
                              style: kmainTextStyle.copyWith(
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.white,
                              foregroundColor: kActiveCardColor,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10)),
                              // ignore: deprecated_member_use
                              child: const Icon(FontAwesomeIcons.add),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.white,
                              foregroundColor: kActiveCardColor,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              // ignore: deprecated_member_use
                              child: const Icon(FontAwesomeIcons.subtract),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (selectedGender == null) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog.adaptive(
                      backgroundColor: kcardColor,
                      title: Text(
                        'ERROR',
                        style: TextStyle(color: Colors.red),
                      ),
                      content: Text('MUST SELECT A GENDER'),
                    );
                  },
                );
                return;
              }
              Calculator calc = Calculator(weight, height);
              var bmi = calc.calculateBMI();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      bmi: bmi,
                    );
                  },
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 60.0,
              // color: const Color(0XFFEB1555),
              color: selectedGender == null
                  ? kcardColor
                  : selectedGender == Gender.male
                      ? Gender.male.color
                      : Gender.female.color,
              child: const Center(
                child: Text(
                  'CALCULATE',
                  style: kMainButtonStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
