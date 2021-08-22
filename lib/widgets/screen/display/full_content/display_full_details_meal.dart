import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../../../item/item_meal.dart';
import '../../../../models/dummy_data.dart';
import '../../../../models/meal.dart';

class DisplayFullDetailsMeal extends StatefulWidget {
  static const routeName = '/full-details';

  final List<Meal> mealFavorites;
  DisplayFullDetailsMeal({required this.mealFavorites});

  @override
  _DisplayFullDetailsMealState createState() => _DisplayFullDetailsMealState();
}

class _DisplayFullDetailsMealState extends State<DisplayFullDetailsMeal> {
  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _addFavorites(String id, Meal availableMeals) {
    setState(() {
      // _mealFavorites.removeWhere((element) => element.id == id);
      Meal? _m = widget.mealFavorites.firstWhereOrNull((e) {
        return e.id == id;
      });
      if (["", null, false, 0].contains(_m)) {
        //add
        widget.mealFavorites.add(availableMeals);
      } else {
        widget.mealFavorites.remove(_m);
      }
    });
    inspect(widget.mealFavorites);
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 350,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = (ModalRoute.of(context)!.settings.arguments as Map);
    final data = routeArgs['data'];
    final categoryMeals = DUMMY_MEALS.firstWhere((e) {
      return e.id == data['id'];
    });
    List<Meal> _tempFavorite = routeArgs['meal_favorites'];
    bool _isFavorite = false;

    print("{$data['action'] action}");

    if (_tempFavorite.isNotEmpty) {
      Meal? _m = _tempFavorite.firstWhereOrNull((e) {
        return e.id == data['id'];
      });

      if (_m != null) {
        _isFavorite = true;
      }

      // inspect(_tempFavorite);
    } else {
      // print('empty');
      _isFavorite = false;
    }
    // print('tempFavorites');
    // inspect(_tempFavorite);

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryMeals.title),
        backgroundColor: data['color'],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                categoryMeals.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (e, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(categoryMeals.ingredients[index]),
                    ),
                  );
                },
                itemCount: categoryMeals.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (e, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(categoryMeals.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: categoryMeals.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              heroTag: null,
              child: Icon(
                Icons.star,
                color:
                    _isFavorite ? Colors.white : Theme.of(context).primaryColor,
              ),
              onPressed: () {
                if (data['action'] == 'display_category') {
                  _addFavorites(data['id'], categoryMeals);
                } else if (data['action'] == 'tab_favorites') {
                  Navigator.of(context)
                      .pop({'id': data['id'], 'action': 'favorites'});
                }
              },
            ),
            FloatingActionButton(
              heroTag: null,
              child: Icon(Icons.delete),
              onPressed: () {
                Navigator.of(context)
                    .pop({'id': data['id'], 'action': 'delete'});
              },
            ),
          ],
        ),
      ),
    );
  }
}
