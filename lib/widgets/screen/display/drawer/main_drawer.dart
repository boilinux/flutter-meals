import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTiles(String title, IconData icon) {
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
      onTap: () {},
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
            child: Text(
              'Test',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 30,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTiles('Meals', Icons.restaurant),
          buildListTiles('Filters', Icons.settings),
        ],
      ),
    );
  }
}
