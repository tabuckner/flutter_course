import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';

class MealItem extends StatelessWidget {
  @required
  final String title;
  @required
  final String imageUrl;
  @required
  final int duration;
  @required
  final Complexity complexity;
  @required
  final Affordability affordability;

  MealItem({
    this.title,
    this.imageUrl,
    this.duration,
    this.complexity,
    this.affordability,
  });

  void selectMeal() {}

  String get complexityText {
    switch (this.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default: 
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (this.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default: 
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    this.imageUrl,
                    height: 250, // Fixed Height...gross
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 8,
                  child: Container(
                    width: 300,
                    color: Colors.black38,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 4),
                      Text('${this.duration} min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 4),
                      Text('${this.complexityText}'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 4),
                      Text('${this.affordabilityText}'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
