import 'package:flutter/material.dart';

import '../../item/item_meal.dart';
// import '../../../models/dummy_data.dart';
import '../../../models/meal.dart';

class DisplayCategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> DUMMY_MEALS;
  final Function addFavoritesHandler;
  DisplayCategoryMeals(
      {required this.DUMMY_MEALS, required this.addFavoritesHandler});

  @override
  _DisplayCategoryMealsState createState() => _DisplayCategoryMealsState();
}

class _DisplayCategoryMealsState extends State<DisplayCategoryMeals> {
  late List<Meal> categoryMeals;
  late final routeArgs;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      routeArgs = (ModalRoute.of(context)!.settings.arguments as Map);
      categoryMeals = widget.DUMMY_MEALS.where((e) {
        return e.categories.contains(routeArgs['id']);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(String id) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == id);
    });
  }

  // void _addFavorites(String id) {
  //   setState(() {
  //     categoryMeals.removeWhere((element) => element.id == id);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title'].toString()),
        backgroundColor: routeArgs['color'],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = categoryMeals[index];
          return ItemMeal(
            data: {
              'id': meal.id,
              'title': meal.title,
              'imageUrl': meal.imageUrl,
              'duration': meal.duration,
              'affordability': meal.affordability,
              'complexity': meal.complexity,
              'color': routeArgs['color'],
            },
            removeItem: _removeItem,
            addFavorites: widget.addFavoritesHandler,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
