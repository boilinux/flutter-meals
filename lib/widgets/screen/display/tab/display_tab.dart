import 'package:flutter/material.dart';

import '../../main/main_category.dart';
import './tab_favorites.dart';
import '../../../../models/meal.dart';

class DisplayTab extends StatefulWidget {
  final List<Meal> favorites;

  DisplayTab({required this.favorites});

  @override
  _DisplayTabState createState() => _DisplayTabState();
}

class _DisplayTabState extends State<DisplayTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favorites',
                )
              ],
            ),
          ),
          body: TabBarView(children: [
            MainCategory(),
            TabFavorites(
              favorites: widget.favorites,
            ),
          ]),
        ));
  }
}
