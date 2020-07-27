import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    // TODO: implement dispose
    this.formKey.currentState.dispose();
    this.scaffoldKey.currentState.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Lütfen isminizi giriniz",
                labelText: "İsim",
                border: OutlineInputBorder(),
              ),
              validator: (val) {
                if (val.isEmpty) return "error";
                return null;
              },
            ),
            SizedBox(height: 30.0),
            TextFormField(
              validator: (val) {
                if (val.length < 6) return "minimum 6 sembol olabilir";
                return null;
              },
            ),
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                if (formKey.currentState.validate()) {
                  print("true");
                } else {
                  scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Row(
                        children: <Widget>[
                          Icon(Icons.close),
                          Text("Yanlış"),
                        ],
                      ),
                    ),
                  );
                }
                formKey.currentState.reset();
              },
            )
          ],
        ),
      ),
    );
  }
}
