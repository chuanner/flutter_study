import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "22222",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "hello world",
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        body: new Center(
          child: new Text(
            "hello wor ld",
            style: new TextStyle(fontSize: 20.0, color: Colors.yellow[600]),
          ),
        ),
      ),
    );
  }
}
