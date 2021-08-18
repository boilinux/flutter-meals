import 'package:flutter/material.dart';

import '../../../item/item_meal.dart';
import '../../../../models/dummy_data.dart';

class DisplayFullDetailsMeal extends StatelessWidget {
  static const routeName = '/full-details';

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
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
    );
  }
}
