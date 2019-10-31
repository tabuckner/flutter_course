import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/shared/widgets/category_item.dart';
import 'package:flutter_complete_guide/shared/mocks/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        children: DUMMY_CATEGORIES
            .map(
              (category) => CategoryItem(
                color: category.color,
                title: category.title,
                id: category.id
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
