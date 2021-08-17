import 'package:flutter/material.dart';
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
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
