import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_complete_guide/shared/mocks/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailsScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
              ),
            ),
            this.buildSectionTitle(context, 'Ingredients'),
            this.buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, i) => Card(
                  color: Theme.of(context).accentColor,
                  child: Container(
                    child: Text(
                      selectedMeal.ingredients[i],
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                ),
              ),
            ),
            this.buildSectionTitle(context, 'Ingredients'),
            this.buildContainer(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, i) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(i + 1)}'),
                      ),
                      title: Text(selectedMeal.steps[i]),
                    ),
                    Divider()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(this.isFavorite(mealId) ? Icons.favorite : Icons.favorite_border),
        onPressed: () => this.toggleFavorite(mealId),
      ),
    );
  }
}
