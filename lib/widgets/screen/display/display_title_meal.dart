import 'package:flutter/material.dart';

class DisplayTitleMeal extends StatelessWidget {
  final data;
  DisplayTitleMeal({required this.data});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 5,
      child: Container(
        width: 300,
        color: Colors.black54,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Text(
          data['title'],
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          softWrap: true,
          overflow: TextOverflow.fade,
        ),
      ),
    );
  }
}
