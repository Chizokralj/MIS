import 'package:flutter/material.dart';
import '../models/meal_item.dart';

class MealGridItem extends StatelessWidget {
  final MealItem meal;
  final VoidCallback onTap;

  const MealGridItem({
    super.key,
    required this.meal,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            Image.network(meal.image, height: 100),
            Text(
              meal.name,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
