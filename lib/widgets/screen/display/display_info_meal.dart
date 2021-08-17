import 'package:flutter/material.dart';
import '../../../models/meal.dart';

class DisplayInfoMeal extends StatelessWidget {
  final data;
  DisplayInfoMeal({required this.data});

  String get complexityText {
    if (data['complexity'] == Complexity.Simple) {
      return 'Simple';
    } else if (data['complexity'] == Complexity.Challenging) {
      return 'Challenging';
    } else if (data['complexity'] == Complexity.Hard) {
      return 'Hard';
    } else {
      return 'Unknown';
    }
  }

  String get affordabilityText {
    if (data['affordability'] == Affordability.Cheap) {
      return 'Cheap';
    } else if (data['affordability'] == Affordability.Affordable) {
      return 'Affordable';
    } else if (data['affordability'] == Affordability.Luxurious) {
      return 'Luxurious';
    } else if (data['affordability'] == Affordability.Pricey) {
      return 'Pricey';
    } else {
      return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Icon(Icons.schedule),
              SizedBox(
                width: 6,
              ),
              Text(data['duration'].toString() + ' min'),
            ],
          ),
          Row(
            children: [
              Icon(Icons.work),
              SizedBox(
                width: 6,
              ),
              Text(complexityText),
            ],
          ),
          Row(
            children: [
              Icon(Icons.attach_money),
              SizedBox(
                width: 6,
              ),
              Text(affordabilityText),
            ],
          ),
        ],
      ),
    );
  }
}
