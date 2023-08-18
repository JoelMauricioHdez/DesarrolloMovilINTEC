import 'package:flutter/material.dart';
import 'package:recipe_app/recipe.dart';

// ignore: must_be_immutable
class RecipeDetail extends StatefulWidget {
  RecipeDetail({super.key, required this.recipe});

  Recipe recipe;

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  double _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.asset(widget.recipe.imageURL),
          ),
          const SizedBox(height: 10),
          Text(
            widget.recipe.label,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Palatino',
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.recipe.ingredients.length,
              itemBuilder: (BuildContext context, index) {
                final ingredient = widget.recipe.ingredients[index];
                return Text(
                    '${ingredient.quantity * _sliderVal} ${ingredient.container} ${ingredient.name}');
              },
            ),
          ),
          Slider(
              min: 1,
              max: 10,
              divisions: 9,
              label: '${widget.recipe.servings * _sliderVal} servings',
              value: _sliderVal,
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.toDouble();
                });
              })
        ],
      ),
    );
  }
}
