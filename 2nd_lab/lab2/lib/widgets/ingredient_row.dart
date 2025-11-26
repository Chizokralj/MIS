import 'package:flutter/material.dart';

class IngredientRow extends StatelessWidget {
  final String ingredient;
  final String measure;

  const IngredientRow({
    super.key,
    required this.ingredient,
    required this.measure,
  });

  @override
  Widget build(BuildContext context) {
    return Text("• $ingredient - $measure");
  }
}
