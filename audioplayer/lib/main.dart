import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildTextButton(Colors.red, 1),
              buildTextButton(Colors.green, 2),
              buildTextButton(Colors.teal, 3),
              buildTextButton(Colors.yellow, 4),
              buildTextButton(Colors.black, 5),
              buildTextButton(Colors.cyan, 6),
              buildTextButton(Colors.grey, 7),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextButton(Color color, int soundNumber) {
    return Expanded(
      child: TextButton(
        onPressed: () async {
          final player = AudioPlayer();
          player.play(
            AssetSource("note$soundNumber.wav"),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(color),
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
        ),
        child: const Text(""),
      ),
    );
  }
}
