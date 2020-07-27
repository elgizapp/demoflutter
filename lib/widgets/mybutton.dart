import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  MyButton({Key key, @required this.child, this.elevation = 5.0})
      : super(key: key);

  final Widget child;
  final double elevation;

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  String _data;
  void onPressed() {
    print("pressed");
    setState(() {
      _data = "nolduki?";
    });
  }

  @override
  void initState() {
    super.initState();

    _data = "la oglim";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_data),
        RaisedButton(
            onPressed: this.onPressed,
            elevation: this.widget.elevation,
            child: this.widget.child),
      ],
    );
  }
}
