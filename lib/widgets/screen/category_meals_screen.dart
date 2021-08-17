import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String id;
  // final String title;

  // CategoryMealsScreen({required this.id, required this.title});

  @override
  Widget build(BuildContext context) {
    final routeArgs = (ModalRoute.of(context)!.settings.arguments as Map);
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title'].toString()),
      ),
      body: Container(child: Text('recepi here!')),
    );
  }
}
