import 'package:flutter/material.dart';

class DisplayImageMeal extends StatelessWidget {
  final data;
  DisplayImageMeal({required this.data});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      child: Image.network(
        data['imageUrl'],
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
