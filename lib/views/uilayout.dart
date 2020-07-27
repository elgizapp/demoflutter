import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UILayout extends StatefulWidget {
  @override
  _UILayoutState createState() => _UILayoutState();
}

class _UILayoutState extends State<UILayout> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            title: Text("face"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            title: Text("alarm"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 300,
                  color: Colors.white,
                );
              });
        },
        child: Icon(Icons.ac_unit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
          width: ScreenUtil().setWidth(500),
          height: ScreenUtil().setWidth(100),
          color: Colors.grey[500]),
    );
  }
}
