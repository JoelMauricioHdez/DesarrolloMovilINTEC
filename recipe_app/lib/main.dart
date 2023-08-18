import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(Recipe());

// ignore: must_be_immutable
class Recipe extends StatelessWidget {
  Recipe({super.key});

  String titulo = "Recipe app";

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();

    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.red,
          secondary: Colors.white,
        ),
      ),
      title: titulo,
      home: Home(title: titulo),
    );
  }
}
