import 'package:flutter/material.dart';
import './drawer/main_drawer.dart';

class DisplayFilters extends StatelessWidget {
  static const routeName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: null,
      // bottomNavigationBar: BottomNavigationBar(
      //     onTap: _selectPage,
      //     backgroundColor: Theme.of(context).primaryColor,
      //     unselectedItemColor: Theme.of(context).accentColor,
      //     selectedItemColor: Colors.white,
      //     currentIndex: _selectedPageIndex,
      //     // type: BottomNavigationBarType.shifting,
      //     items: [
      //       BottomNavigationBarItem(
      //         backgroundColor: Theme.of(context).primaryColor,
      //         icon: Icon(Icons.category),
      //         label: 'Categories',
      //       ),
      //       BottomNavigationBarItem(
      //         backgroundColor: Theme.of(context).primaryColor,
      //         icon: Icon(Icons.star),
      //         label: 'Favorites',
      //       ),
      //     ]),
    );
  }
}
