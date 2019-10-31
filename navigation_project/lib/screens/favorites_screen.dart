import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/shared/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (this.favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet--start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, i) {
          var meal = this.favoriteMeals[i];
          return MealItem(
            id: meal.id,
            title: meal.title,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
            imageUrl: meal.imageUrl,
          );
        },
        itemCount: this.favoriteMeals.length,
      );
    }
  }
}
