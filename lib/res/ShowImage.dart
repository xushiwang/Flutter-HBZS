import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:hbzs/res/ShowMD.dart';

class ShowImage extends StatefulWidget {
  ShowImage({Key key}) : super(key: key);

  @override
  _ShowImageState createState() => _ShowImageState();
}

String txt = "";

class _ShowImageState extends State<ShowImage> {
  @override
  void initState() {
    super.initState();
    getHttp();
  }

  getHttp() async {
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.get("https://xushiwang.github.io/wxpay.txt");
      print(response.data.toString());
      setState(() {
        txt = response.data.toString();
      });
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("鼓励一下", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: ListView(children: <Widget>[
          Image.asset("images/wxpay.jpeg"),
          Padding(
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                child: Text("查看赞赏记录"),
                onPressed: () {
                  print("点击了查看赞赏记录");
                   Navigator.of(context)
                        .push(new MaterialPageRoute(builder: (_) {
                      return ShowMD(
                        txt: txt.toString(),
                      );
                    }));
                },
              ))
        ]));
  }
}
