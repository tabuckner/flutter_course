import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/shared/mocks/dummy_data.dart';
import 'package:flutter_complete_guide/shared/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  CategoryMealsScreen();

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          var meal = categoryMeals[i];
          return MealItem(
            title: meal.title,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
            imageUrl: meal.imageUrl,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
