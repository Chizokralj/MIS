class MealDetails {
  final String name;
  final String image;
  final String instructions;
  final String youtube;
  final Map<String, String> ingredients;

  MealDetails({
    required this.name,
    required this.image,
    required this.instructions,
    required this.youtube,
    required this.ingredients,
  });

  factory MealDetails.fromJson(Map<String, dynamic> json) {
    Map<String, String> ing = {};

    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];
      if (ingredient != null && ingredient.toString().trim().isNotEmpty) {
        ing[ingredient] = measure ?? '';
      }
    }

    return MealDetails(
      name: json['strMeal'],
      image: json['strMealThumb'],
      instructions: json['strInstructions'],
      youtube: json['strYoutube'] ?? '',
      ingredients: ing,
    );
  }
}
