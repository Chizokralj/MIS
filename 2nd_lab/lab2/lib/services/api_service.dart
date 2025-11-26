import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/category.dart';
import '../models/meal_item.dart';
import '../models/meal_details.dart';

class ApiService {
  static const base = "https://www.themealdb.com/api/json/v1/1";

  static Future<List<Category>> getCategories() async {
    final res = await http.get(Uri.parse("$base/categories.php"));
    final data = jsonDecode(res.body);
    return (data['categories'] as List)
        .map((c) => Category.fromJson(c))
        .toList();
  }

  static Future<List<MealItem>> getMealsByCategory(String category) async {
    final res = await http.get(Uri.parse("$base/filter.php?c=$category"));
    final data = jsonDecode(res.body);
    return (data['meals'] as List)
        .map((m) => MealItem.fromJson(m))
        .toList();
  }

  static Future<List<MealItem>> searchMeals(String query) async {
    final res = await http.get(Uri.parse("$base/search.php?s=$query"));
    final data = jsonDecode(res.body);
    if (data['meals'] == null) return [];
    return (data['meals'] as List)
        .map((m) => MealItem.fromJson(m))
        .toList();
  }

  static Future<MealDetails> getMealDetails(String id) async {
    final res = await http.get(Uri.parse("$base/lookup.php?i=$id"));
    final data = jsonDecode(res.body);
    return MealDetails.fromJson(data['meals'][0]);
  }

  static Future<MealDetails> getRandomMeal() async {
    final res = await http.get(Uri.parse("$base/random.php"));
    final data = jsonDecode(res.body);
    return MealDetails.fromJson(data['meals'][0]);
  }
}
