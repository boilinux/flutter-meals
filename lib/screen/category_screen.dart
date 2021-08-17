import 'package:app_meals/item/category_item.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  // const CategoryScreen({ Key? key }) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((e) {
          return CategoryItem(title: e.title, color: e.color);
        }).toList(),
      ),
    );
  }
}