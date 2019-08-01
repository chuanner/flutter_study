import 'package:flutter/material.dart';

//必须 执行入口
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "hello",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("list"),
        ),
        body: new Container(
          decoration: new BoxDecoration(color: Colors.yellow),
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Container(
                      decoration: new BoxDecoration(
                        border: new Border.all(width: 10.0, color: Colors.red),
                        borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      margin: const EdgeInsets.all(4.0),
                      child: new Image.asset("images/lake.jpg"),
                    ),
                  ),
                  new Expanded(
                    child: new Container(
                      decoration: new BoxDecoration(
                        border: new Border.all(width: 10.0, color: Colors.red),
                        borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      margin: const EdgeInsets.all(4.0),
                      child: new Image.asset("images/lake.jpg"),
                    ),
                  ),
                  
                ],
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Container(
                      decoration: new BoxDecoration(
                        border: new Border.all(width: 10.0, color: Colors.red),
                        borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      margin: const EdgeInsets.all(4.0),
                      child: new Image.asset("images/lake.jpg"),
                    ),
                  ),
                  new Expanded(
                    child: new Container(
                      decoration: new BoxDecoration(
                        border: new Border.all(width: 10.0, color: Colors.red),
                        borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      margin: const EdgeInsets.all(4.0),
                      child: new Image.asset("images/lake.jpg"),
                    ),
                  ),
                  
                ],
              )
            ],
          ),

          
          // child: new Center(
          //   child: new Text(
          //     "one",
          //     textDirection: TextDirection.ltr,
          //     style: new TextStyle(fontSize: 40.0, color: Colors.black26),
          //   ),
          // ),
        ),
      ),
    );
  }
}
