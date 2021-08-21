import 'package:flutter/material.dart';

import 'widgets/screen/main/main_category.dart';
import 'widgets/screen/display/display_category_meals.dart';
import 'widgets/screen/display/full_content/display_full_details_meal.dart';
import 'widgets/screen/display/tab/display_tab.dart';
import 'widgets/screen/display/tab/display_bottom_tab.dart';
import 'widgets/screen/display/display_filters.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'Gluten-free': false,
    'Vegetarian': false,
    'Vegan': false,
    'Lactose-free': false,
  };

  void _setFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
    });
    print(_filters);
  }

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
        // '/': (ctx) => DisplayTab(),
        '/': (ctx) => DisplayBottommTab(),
        DisplayCategoryMeals.routeName: (ctx) => DisplayCategoryMeals(),
        DisplayFullDetailsMeal.routeName: (ctx) => DisplayFullDetailsMeal(),
        DisplayFilters.routeName: (ctx) =>
            DisplayFilters(setFilterHandler: _setFilters),
      },
      onGenerateRoute: (e) {
        print(e.arguments);

        return MaterialPageRoute(builder: (ctx) => MainCategory());
      },
      onUnknownRoute: (e) {
        return MaterialPageRoute(builder: (ctx) => MainCategory());
      },
    );
  }
}
