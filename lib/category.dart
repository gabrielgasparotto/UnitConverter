import 'package:flutter/material.dart';

class Category extends StatelessWidget {

  final String name;
  final IconData iconLocation;

  const Category({
    Key key,
    @required this.name,
    @required this.iconLocation,
  })  : assert(name != null),
        assert(iconLocation != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 100.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          highlightColor: Colors.pink[100],
          splashColor: Colors.pink[100],
          onTap: () {
            print('bom dia');
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
}
