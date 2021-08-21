import 'package:flutter/material.dart';
import './drawer/main_drawer.dart';

class DisplayFilters extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> mainFilter;
  final Function setFilterHandler;
  DisplayFilters({required this.setFilterHandler, required this.mainFilter});

  @override
  _DisplayFiltersState createState() => _DisplayFiltersState();
}

class _DisplayFiltersState extends State<DisplayFilters> {
  // Map<String, bool> filters = widget.mainFilter;

  Widget _buildSwitchListTile(String title, String subtitle) {
    // bool value = filters[title] as bool;
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: (e) {
        setState(() {
          if (widget.mainFilter[title] == true) {
            widget.mainFilter[title] = false;
          } else {
            widget.mainFilter[title] = true;
          }
        });
      },
      value: (widget.mainFilter[title] as bool),
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
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only included vegetarian meals',
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only included vegan meals',
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only included lactose-free meals',
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.save,
        ),
        onPressed: () => widget.setFilterHandler(widget.mainFilter, context),
      ),
    );
  }
}
