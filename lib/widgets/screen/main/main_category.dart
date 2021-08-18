import '../../item/category_item.dart';
import 'package:flutter/material.dart';

import '../../../models/dummy_data.dart';

class MainCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES.map((e) {
        return CategoryItem(id: e.id, title: e.title, color: e.color);
      }).toList(),
    );
  }
}
