import 'package:flutter/material.dart';

import '../../main/main_category.dart';
import './tab_favorites.dart';
import '../drawer/main_drawer.dart';
import '../../../../models/meal.dart';

class DisplayBottommTab extends StatefulWidget {
  final List<Meal> favorites;

  DisplayBottommTab({required this.favorites});

  @override
  _DisplayBottommTabState createState() => _DisplayBottommTabState();
}

class _DisplayBottommTabState extends State<DisplayBottommTab> {
  List _pages = [];

  @override
  void didChangeDependencies() {
    _pages = [
      {
        'page': MainCategory(),
        'title': 'Categories',
      },
      {
        'page': TabFavorites(
          favorites: widget.favorites,
        ),
        'title': 'Your Favorites',
      },
    ];
    super.didChangeDependencies();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).accentColor,
          selectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ]),
    );
  }
}
