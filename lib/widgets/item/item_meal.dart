import 'package:flutter/material.dart';
import '../screen/display/display_image_meal.dart';
import '../screen/display/display_title_meal.dart';
import '../screen/display/display_info_meal.dart';

class ItemMeal extends StatelessWidget {
  final data;
  ItemMeal({required this.data});

  void _selectMeal() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                DisplayImageMeal(data: data),
                DisplayTitleMeal(data: data),
              ],
            ),
            DisplayInfoMeal(data: data),
          ],
        ),
      ),
    );
  }
}
