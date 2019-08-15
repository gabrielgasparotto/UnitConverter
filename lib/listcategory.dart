import 'package:flutter/material.dart';

import 'category.dart';

class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  Widget buildCategoryRoute(Orientation orientation, List<Widget> categories) {
    if (orientation == Orientation.portrait) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) => categories[index],
        itemCount: categories.length,
      );
    } else {
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3.0,
        children: categories,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];

    for (var i = 0; i < categoryNames.length; i++) {
      categories.add(Category(
        name: categoryNames[i],
        iconLocation: Icons.cake,
      ));
    }

    final listView = Container(
      color: Colors.grey[100],
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: buildCategoryRoute(MediaQuery.of(context).orientation, categories),
    );

    return Scaffold(
      body: listView,
    );
  }
}
