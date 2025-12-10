import 'package:flutter/material.dart';
import '../models/category.dart';
import '../services/api_service.dart';
import '../widgets/category_card.dart';
import 'meal_details_screen.dart';
import 'meals_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> categories = [];
  List<Category> filtered = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    categories = await ApiService.getCategories();
    setState(() => filtered = categories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Categories"),
        actions: [
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () async {
              final meal = await ApiService.getRandomMeal();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MealDetailsScreen(meal: meal),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search categories...",
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {
                  filtered = categories
                      .where((c) =>
                      c.name.toLowerCase().contains(text.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (_, i) {
                final c = filtered[i];
                return CategoryCard(
                  category: c,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MealsScreen(category: c.name),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
