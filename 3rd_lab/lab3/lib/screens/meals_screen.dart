import 'package:flutter/material.dart';
import '../models/meal_item.dart';
import '../services/api_service.dart';
import '../widgets/meal_grid_item.dart';
import 'meal_details_screen.dart';

class MealsScreen extends StatefulWidget {
  final String category;
  const MealsScreen({super.key, required this.category});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  List<MealItem> meals = [];
  List<MealItem> filtered = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    meals = await ApiService.getMealsByCategory(widget.category);
    setState(() => filtered = meals);
  }

  void search(String text) async {
    if (text.isEmpty) {
      setState(() => filtered = meals);
      return;
    }
    filtered = await ApiService.searchMeals(text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search meals...",
                border: OutlineInputBorder(),
              ),
              onChanged: search,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: filtered.length,
              itemBuilder: (_, i) {
                final m = filtered[i];
                return MealGridItem(
                  meal: m,
                  onTap: () async {
                    final details = await ApiService.getMealDetails(m.id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            MealDetailsScreen(meal: details),
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
