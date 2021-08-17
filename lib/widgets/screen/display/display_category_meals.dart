import 'package:flutter/material.dart';

import '../../item/item_meal.dart';
import '../../../models/dummy_data.dart';

class DisplayCategoryMeals extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs = (ModalRoute.of(context)!.settings.arguments as Map);
    final categoryMeals = DUMMY_MEALS.where((e) {
      return e.categories.contains(routeArgs['id']);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title'].toString()),
        backgroundColor: routeArgs['color'],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = categoryMeals[index];
          return ItemMeal(data: {
            'title': meal.title,
            'imageUrl': meal.imageUrl,
            'duration': meal.duration,
            'affordability': meal.affordability,
            'complexity': meal.complexity,
          });
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
