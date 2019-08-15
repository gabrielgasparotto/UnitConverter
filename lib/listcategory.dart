import 'package:category_app/united.dart';
import 'package:flutter/material.dart';

import 'category.dart';

class CategoryRoute extends StatefulWidget {
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

  static const baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
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

  List<Unit> retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];

    for (var i = 0; i < CategoryRoute.categoryNames.length; i++) {
      categories.add(Category(
        name: CategoryRoute.categoryNames[i],
        color: CategoryRoute.baseColors[i],
        iconLocation: Icons.cake,
        units: retrieveUnitList(CategoryRoute.categoryNames[i]),
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
