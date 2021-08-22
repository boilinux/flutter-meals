import 'package:flutter/material.dart';

import '../../../../models/meal.dart';
import '../../../item/item_meal.dart';

class TabFavorites extends StatelessWidget {
  final Function addFavoritesHandler;
  final List<Meal> mealFavorites;

  TabFavorites({
    required this.addFavoritesHandler,
    required this.mealFavorites,
  });

  @override
  Widget build(BuildContext context) {
    print(mealFavorites);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = mealFavorites[index];
          return ItemMeal(
            data: {
              'id': meal.id,
              'title': meal.title,
              'imageUrl': meal.imageUrl,
              'duration': meal.duration,
              'affordability': meal.affordability,
              'complexity': meal.complexity,
              'color': Colors.pink,
            },
            removeItem: () {},
            addFavorites: addFavoritesHandler,
            mealFavorites: mealFavorites,
          );
        },
        itemCount: mealFavorites.length,
      ),
    );
  }
}
