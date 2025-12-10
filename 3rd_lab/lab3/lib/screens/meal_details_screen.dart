import 'package:flutter/material.dart';
import '../models/meal_details.dart';
import '../widgets/ingredient_row.dart';

class MealDetailsScreen extends StatelessWidget {
  final MealDetails meal;
  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(meal.image),
            const SizedBox(height: 16),
            Text(
              "Ingredients:",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ...meal.ingredients.entries.map(
                  (e) => IngredientRow(
                ingredient: e.key,
                measure: e.value,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Instructions:",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(meal.instructions),
            const SizedBox(height: 16),
            if (meal.youtube.isNotEmpty)
              TextButton(
                child: const Text("Watch on YouTube"),
                onPressed: () {},
              ),
          ],
        ),
      ),
    );
  }
}
