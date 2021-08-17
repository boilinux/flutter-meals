import 'package:flutter/material.dart';

import 'widgets/screen/main/main_category.dart';
import 'widgets/screen/display/display_category_meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
              headline1: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.normal,
                    fontSize: 24,
                  ),
                  button: TextStyle(
                    color: Colors.purple,
                  ),
                )),
      ),
      routes: {
        '/': (ctx) => MainCategory(),
        DisplayCategoryMeals.routeName: (ctx) => DisplayCategoryMeals(),
      },
    );
  }
}
