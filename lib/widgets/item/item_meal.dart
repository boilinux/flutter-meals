import 'package:flutter/material.dart';
import '../screen/display/display_image_meal.dart';
import '../screen/display/display_title_meal.dart';
import '../screen/display/display_info_meal.dart';
import '../screen/display/full_content/display_full_details_meal.dart';

class ItemMeal extends StatelessWidget {
  final data;
  final Function removeItem;
  final Function addFavorites;
  ItemMeal({
    required this.data,
    required this.removeItem,
    required this.addFavorites,
  });

  void _selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      DisplayFullDetailsMeal.routeName,
      arguments: {
        'data': {
          'id': data['id'],
          'title': data['title'],
          'color': data['color'],
        },
      },
    ).then((value) {
      if (value != null) {
        String _action = (value as Map)['action'];
        String _id = (value as Map)['id'];
        if (_action == 'delete') {
          removeItem(_id);
        } else if (_action == 'favorites') {
          addFavorites(_id);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
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
