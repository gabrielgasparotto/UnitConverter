import 'package:flutter/material.dart';

import 'listcategory.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          title: Text('Unit Converter', style: TextStyle(color: Colors.black)),
        ),
        body: Center(
          child: CategoryRoute(),
        ),
      ),
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }
}