import 'dart:ui';

import 'package:flutter/material.dart';

import './models/dummy_data.dart';
import './models/meal.dart';
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

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filters, BuildContext ctx) {
    setState(() {
      _filters = filters;

      _availableMeals = _availableMeals.where((element) {
        if ((_filters['Gluten-free'] as bool) && !element.isGlutenFree) {
          return false;
        }
        if ((_filters['Vegetarian'] as bool) && !element.isVegetarian) {
          return false;
        }
        if ((_filters['Vegan'] as bool) && !element.isVegan) {
          return false;
        }
        if ((_filters['Lactose-free'] as bool) && !element.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
    showAlertDialog(ctx);
    print(_filters);
  }

  void showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Message",
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      content: Text("Successfully save!"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: alert,
        );
      },
    );
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
        DisplayCategoryMeals.routeName: (ctx) => DisplayCategoryMeals(
              DUMMY_MEALS: _availableMeals,
            ),
        DisplayFullDetailsMeal.routeName: (ctx) => DisplayFullDetailsMeal(),
        DisplayFilters.routeName: (ctx) => DisplayFilters(
              setFilterHandler: _setFilters,
              mainFilter: _filters,
            ),
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
