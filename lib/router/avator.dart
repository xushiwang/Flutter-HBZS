import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Avator extends StatefulWidget {
  Avator({Key key}) : super(key: key);

  @override
  _AvatorState createState() => _AvatorState();
}

String img_url =
    "https://img2.woyaogexing.com/2019/12/28/ebc0f9f2e4bd498283d51d96f878f391!400x400.jpeg";

class _AvatorState extends State<Avator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: img_url == ""
            ? Center(
                child: CircularProgressIndicator(backgroundColor: Colors.grey))
            : Column(children: <Widget>[
                Expanded(child: Column()),
                Center(child: Image.network(img_url)),
                Expanded(
                    child: Center(
                        child: OutlineButton(
                  borderSide: new BorderSide(color: Colors.white),
                  onPressed: () {
                    print("gengguantouxaig");
                  },
                  child: Text("更换头像"),
                  textColor: Colors.white,
                  color: Colors.white,
                )))
              ]));
  }
}
