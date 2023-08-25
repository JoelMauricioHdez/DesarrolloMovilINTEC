import 'package:flutter/material.dart';
import 'package:quizapp/models/questions.dart';
import 'package:quizapp/quiz_brain.dart';

// ignore: must_be_immutable
class Quiz extends StatefulWidget {
  Quiz({Key? key, required this.qbank}) : super(key: key);

  List<Question> qbank;

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  QuizzBrain brain = QuizzBrain();
  List<Widget> answers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              flex: 18,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  widget.qbank[brain.currentQuestion].question,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: answerButton("True", Colors.green),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: answerButton("False", Colors.red),
            ),
            const SizedBox(height: 2),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: answers,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton answerButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {
        Widget? result = brain.quizAnswerLogic(
          context,
          text,
          widget.qbank[brain.currentQuestion].correctAnswer,
        );
        setState(() {
          if (result != null) {
            answers.add(result);
          } else {
            answers = [];
          }
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(color),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
