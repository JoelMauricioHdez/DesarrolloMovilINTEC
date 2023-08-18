import 'package:flutter/material.dart';
import 'package:recipe_app/recipe.dart';
import 'package:recipe_app/recipe_detail.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: Recipe.samples.length,
        itemBuilder: (BuildContext context, index) {
          return cardRecipeWidget(context, Recipe.samples[index]);
        },
      ),
    );
  }
}

Widget cardRecipeWidget(BuildContext context, Recipe recipes) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return RecipeDetail(
              recipe: recipes,
            );
          },
        ),
      );
    },
    child: Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(recipes.imageURL),
            ),
            const SizedBox(height: 10),
            Text(
              recipes.label,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  fontFamily: 'Palatino'),
            ),
          ],
        ),
      ),
    ),
  );
}
