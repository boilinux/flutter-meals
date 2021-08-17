import 'package:flutter/material.dart';

import '../../item/item_meal.dart';
import '../../../models/dummy_data.dart';

class DisplayFullDetailsMeal extends StatelessWidget {
  static const routeName = '/full-details';

  @override
  Widget build(BuildContext context) {
    final routeArgs = (ModalRoute.of(context)!.settings.arguments as Map);
    final data = routeArgs['data'];
    final categoryMeals = DUMMY_MEALS.where((e) {
      return e.id.contains(data['id']);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(data['title'].toString()),
        backgroundColor: data['color'],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = categoryMeals[index];
          return Text(meal.ingredients.toString());
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
