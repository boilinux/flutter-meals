import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../../../../models/meal.dart';
import '../../../item/item_meal.dart';

class TabFavorites extends StatefulWidget {
  final List<Meal> mealFavorites;
  final List<Meal> availableMeals;

  TabFavorites({
    required this.mealFavorites,
    required this.availableMeals,
  });

  @override
  _TabFavoritesState createState() => _TabFavoritesState();
}

class _TabFavoritesState extends State<TabFavorites> {
  late List<Meal> __mealFavorites = widget.mealFavorites;

  void _addFavorites(String id) {
    setState(() {
      // _mealFavorites.removeWhere((element) => element.id == id);
      Meal? _m = __mealFavorites.firstWhereOrNull((e) {
        return e.id == id;
      });
      if (["", null, false, 0].contains(_m)) {
        //add
        _m = __mealFavorites.firstWhereOrNull((e) {
          return e.id == id;
        });

        if (!["", null, false, 0].contains(_m)) {
          __mealFavorites.add(_m!);
        }
      } else {
        __mealFavorites.remove(_m);
      }
    });
    // inspect(_mealFavorites);
  }

  void _removeItem(String id) {
    setState(() {
      widget.availableMeals.removeWhere((element) => element.id == id);
      __mealFavorites.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = __mealFavorites[index];
          return ItemMeal(
            data: {
              'id': meal.id,
              'title': meal.title,
              'imageUrl': meal.imageUrl,
              'duration': meal.duration,
              'affordability': meal.affordability,
              'complexity': meal.complexity,
              'color': Colors.pink,
              'action': 'tab_favorites',
            },
            removeItem: _removeItem,
            addFavorites: _addFavorites,
            mealFavorites: __mealFavorites,
          );
        },
        itemCount: __mealFavorites.length,
      ),
    );
  }
}
