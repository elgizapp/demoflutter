import 'package:demo/views/form.dart';
import 'package:demo/views/httpHello.dart';
import 'package:demo/views/json_view.dart';
import 'package:demo/views/tabbar_view.dart';
import 'package:demo/views/uilayout.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routes: {
        "/home": (context) => JsonView(),
        "/": (context) => FormView(),
      },
    );
  }
}
