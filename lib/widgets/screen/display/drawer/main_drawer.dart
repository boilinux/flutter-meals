import 'package:flutter/material.dart';

import '../display_filters.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTiles(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      onTap: () => tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'What\'s cooking?',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Theme.of(context).accentColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTiles('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed(
              '/',
              arguments: {
                'data': {},
              },
            );
          }),
          buildListTiles('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(
              DisplayFilters.routeName,
              arguments: {
                'data': {},
              },
            );
          }),
        ],
      ),
    );
  }
}
