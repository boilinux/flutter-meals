import 'package:flutter/material.dart';

import '../../../../models/meal.dart';
import '../../../screen/display/display_image_meal.dart';
import '../../../screen/display/display_title_meal.dart';
import '../../../screen/display/display_info_meal.dart';

class TabFavorites extends StatelessWidget {
  final List<Meal> favorites;
  TabFavorites({required this.favorites});

  @override
  Widget build(BuildContext context) {
    print(favorites);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          // Stack(
          //   children: [
          //     DisplayImageMeal(data: data),
          //     DisplayTitleMeal(data: data),
          //   ],
          // ),
          // DisplayInfoMeal(data: data),
        ],
      ),
    );
  }
}
