import 'package:flutter/material.dart';
import './drawer/main_drawer.dart';

class DisplayFilters extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _DisplayFiltersState createState() => _DisplayFiltersState();
}

class _DisplayFiltersState extends State<DisplayFilters> {
  List filters = [
    {
      'Gluten-free': false,
      'Vegetarian': false,
      'Vegan': false,
      'Lactose-free': false,
    }
  ];

  Widget _buildSwitchListTile(String title, String subtitle, var val) {
    // bool value = filters[title] as bool;
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: (e) {
        setState(() {
          if (filters[0][title] == true) {
            filters[0][title] = false;
          } else {
            filters[0][title] = true;
          }
        });
      },
      value: (filters[0][title] as bool),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    'Gluten-free',
                    'Only included gluten-free meals',
                    filters.map((e) => e == 'Gluten-free')),
                _buildSwitchListTile(
                    'Vegetarian',
                    'Only included vegetarian meals',
                    filters.map((e) => e == 'Vegetarian')),
                _buildSwitchListTile('Vegan', 'Only included vegan meals',
                    filters.map((e) => e == 'Vegan')),
                _buildSwitchListTile(
                    'Lactose-free',
                    'Only included lactose-free meals',
                    filters.map((e) => e == 'Lactose-free')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
