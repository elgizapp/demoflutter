import 'package:demo/views/httpHello.dart';
import 'package:demo/views/uilayout.dart';
import 'package:flutter/material.dart';

class TabbarView extends StatefulWidget {
  @override
  _TabbarViewState createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: SafeArea(
          child: TabBar(
            labelColor: Colors.red,
            tabs: [
              Tab(
                child: Icon(Icons.filter_1),
              ),
              Tab(
                child: Icon(Icons.star),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [UILayout(), HttpHello()],
        ),
      ),
    );
  }
}
