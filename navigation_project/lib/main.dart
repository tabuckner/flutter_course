import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/category_meals_screen.dart';
import 'package:flutter_complete_guide/screens/meal_details_screen.dart';
import 'package:flutter_complete_guide/screens/settings_screen.dart';
import 'package:flutter_complete_guide/screens/tabs_screen.dart';
import 'package:flutter_complete_guide/shared/mocks/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      this._filters = filterData;

      this._availableMeals = DUMMY_MEALS.where((meal) {
        if (this._filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (this._filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (this._filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (this._filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        this._favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        this._favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        this
            ._favoriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return this._favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        canvasColor: Color.fromRGBO(245, 245, 245, 1),
        // fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                // fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      initialRoute: TabsScreen.routeName,
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(
              this._favoriteMeals,
            ),
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
              this._availableMeals,
            ),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(
              this._toggleFavorite,
              this._isMealFavorite,
            ),
        SettingsScreen.routeName: (ctx) => SettingsScreen(
              saveFilters: this._setFilters,
              currentFilters: this._filters,
            ),
      },
      onUnknownRoute: (settings) {
        // TODO: Add a 404 screen in the future.
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
