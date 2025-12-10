class MealItem {
  final String id;
  final String name;
  final String image;

  MealItem({
    required this.id,
    required this.name,
    required this.image,
  });

  factory MealItem.fromJson(Map<String, dynamic> json) {
    return MealItem(
      id: json['idMeal'],
      name: json['strMeal'],
      image: json['strMealThumb'],
    );
  }
}
