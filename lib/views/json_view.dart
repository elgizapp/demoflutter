import 'dart:convert';

import 'package:demo/models/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JsonView extends StatefulWidget {
  @override
  _JsonViewState createState() => _JsonViewState();
}

class _JsonViewState extends State<JsonView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future getData() async {
    return await http
        .get('https://jsonplaceholder.typicode.com/posts')
        .then((res) => res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(alignment: Alignment.center, child: this._postDataWidget),
    );
  }

  Widget get _postDataWidget => FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final List _sdata = json.decode(snapshot.data);
            return ListView.builder(
              itemCount: _sdata.length,
              itemBuilder: (context, index) {
                final _item = Post.fromJson(_sdata[index]);
                return Card(
                  child: ListTile(
                    title: Text(_item.title),
                    subtitle: Text(_item.body),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
}
