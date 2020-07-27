import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpHello extends StatefulWidget {
  @override
  HttpHelloState createState() => HttpHelloState();
}

class HttpHelloState extends State<HttpHello>
    with AutomaticKeepAliveClientMixin {
  bool isLoaded;
  Object userData = {"name": "", "surname": ""};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isLoaded = false;
  }

  Future getData() async {
    await new Future.delayed(const Duration(seconds: 2), () => false);
    return await http.get("http://localhost:8080").then((res) => res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, snapshoot) {
            if (snapshoot.connectionState == ConnectionState.done) {
              if (snapshoot.hasData)
                return Text(json.decode(snapshoot.data).toString());
              else
                Text("You have error.");
            } else if (snapshoot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return Text("Prablemin var brat");
            }
          },
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
