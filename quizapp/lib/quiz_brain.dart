import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizzBrain {
  QuizzBrain({
    this.currentQuestion = 0,
    this.correctCounter = 0,
    this.quizScore = 0,
  });

  int currentQuestion;
  int correctCounter;
  int quizScore;

  Widget? quizAnswerLogic(
      BuildContext context, String text, String questionAnswer) {
    if (currentQuestion == 10) {
      currentQuestion = 0;
      showPopup(context, quizScore);
      quizScore = 0;
      return null;
    } else {
      currentQuestion++;
    }

    if (questionAnswer == text) {
      quizScore++;
      return const Icon(Icons.check, color: Colors.green);
    } else {
      return const Icon(Icons.close, color: Colors.red);
    }
  }

  showPopup(BuildContext context, int score) async {
    await Alert(
      context: context,
      title: "Fin del juego",
      desc: "Usted ha completado el quiz, su puntaje fue: $score/10",
    ).show();
  }
}
