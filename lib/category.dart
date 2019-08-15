import 'package:category_app/united.dart';
import 'package:flutter/material.dart';

import 'converter_route.dart';

class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;

  const Category({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        assert(units != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 100.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          highlightColor: color,
          splashColor: color,
          onTap: () {
            navigateToConverter(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(
                    iconLocation,
                    size: 60.0,
                    color: Colors.grey[700],
                  ),
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.display1.copyWith(
                          color: Colors.grey[700],
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToConverter(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(
      MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return Scaffold(
            body: ConverterRoute(units: units),
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 1.0,
              title: Text(name, style: TextStyle(color: Colors.black)),
              centerTitle: true,
              backgroundColor: color[100],
            ),
          );
        },
      ),
    );
  }
}
