import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hbzs/res/Browser.dart';
import 'package:hbzs/res/MyDrawer.dart';
import 'package:hbzs/res/customview.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List formList = [];
  initState() {
    super.initState();
    getHttp().then((val) {
      setState(() {
        formList = val.toList();
      });
    });
  }

  Future getHttp() async {
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.get("https://xxzx.bjtuhbxy.edu.cn/wxApplets/spaces/home",queryParameters: {"news":"news"});
      print(response.data);
      return response.data["main_url_list"];
    } catch (e) {
      return print(e);
    }
  }

  Widget buildGrid() {
    List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget 
    for (var item in formList) {
      tiles.add(new Container(
          margin: new EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context)
                      .push(new MaterialPageRoute(builder: (_) {
                    return Browser(
                      url: item["href"],
                      title: "校园动态",
                    );
                  }));
            },
            child:Column(children: <Widget>[
            Row(
              children: <Widget>[
                new Icon(
                  Icons.ac_unit,
                  color: Colors.black26,
                  size: 17.0,
                ),
                new Container(
                  margin: new EdgeInsets.only(left: 5.0),
                  child: new Text(
                    '校园动态',
                    style: new TextStyle(color: Color(0xFF888888)),
                  ),
                )
              ],
            ),
            new Divider(
              color: Color(0xFF888888),
            ),
            Text(item['title']),
            new Margin(indent: 6.0),
            Image.network(
              item['news_img'],
              fit: BoxFit.cover,
            ),
            new Margin(indent: 6.0),
            new Text(
              item['content'],
              style: new TextStyle(color: Color(0xFF888888)),
            ),
            new Divider(
              color: Color(0xFF888888),
            ),
          ]))));
    }
    return Column(children: tiles);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          backgroundColor: Colors.white,
          //drawerScrimColor: Colors.transparent.withOpacity(0.8),
          drawer: MyDrawer(),
          //backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                color: Colors.black,
                onPressed: () {
                  print("打开发布动态页面");
                  Navigator.pushNamed(context, '/send');
                },
              )
            ],
            title: Text(
              "首页",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TodayKb(),
              BigDivider(),
              buildGrid(),
            ],
          ))),
    );
  }
}

class TodayKb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("查看课表");
        },
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.camera,
                      color: Colors.black26,
                      size: 17.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Text(
                        '今日课表',
                        style: new TextStyle(color: Color(0xFF888888)),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Color(0xFF888888),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0, bottom: 2.0),
                child: Text("今天居然没有课~" + "\uD83D\uDE01"),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0, bottom: 2.0),
                child: Text('点我查看完整课表',
                    style: TextStyle(
                        color: Color(
                          0xFF888888,
                        ),
                        fontSize: 12.0)),
              ),
            ],
          ),
        ));
  }
}
