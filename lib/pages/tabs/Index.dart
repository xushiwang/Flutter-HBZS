import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hbzs/common/global.dart';
import 'package:hbzs/res/Browser.dart';
import 'package:hbzs/res/MyDrawer.dart';
import 'package:hbzs/res/customview.dart';
import 'package:hbzs/res/style.dart';
import 'package:transparent_image/transparent_image.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List formList = [];
  List formList1 = [];
  initState() {
    super.initState();
    getHttp().then((val) {
      setState(() {
        formList = val.toList();
      });
    });
    getHttp1().then((val) {
      setState(() {
        formList1 = val.toList();
      });
    });
  }

  Future getHttp() async {
    try {
      Response response;
      Dio dio = new Dio();
      response =
          await dio.get(Global.news_url, queryParameters: {"news": "news"});
      print(response.data);
      return response.data["main_url_list"];
    } catch (e) {
      return print(e);
    }
  }

  Future getHttp1() async {
    try {
      Response response;
      Dio dio = new Dio();
      Map<String, String> map = {'uid': Global.account};
      FormData formData = FormData.fromMap(map);
      response = await dio.post(Global.dongtai, data: formData);
      print(response.data);
      return response.data;
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
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return Browser(
                    url: item["href"],
                    title: "校园动态",
                  );
                }));
              },
              child: Column(children: <Widget>[
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
                // Image.network(
                //   item['news_img'],
                //   fit: BoxFit.cover,
                // ),
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: item['news_img'],
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

  Widget buildGridDT() {
    List<Widget> tiles1 = []; //先建一个数组用于存放循环生成的widget
    for (var item in formList1) {
      tiles1.add(new Container(
          margin: new EdgeInsets.all(10.0),
          child: GestureDetector(
              onTap: () {
                if (item["url"] != null) {
                  Navigator.of(context)
                      .push(new MaterialPageRoute(builder: (_) {
                    return Browser(
                      url: item["url"],
                      title: "动态详情",
                    );
                  }));
                }
              },
              child: Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    new Icon(
                      Icons.ac_unit,
                      color: Colors.black26,
                      size: 17.0,
                    ),
                    new Expanded(
                        child: Container(
                      margin: new EdgeInsets.only(left: 5.0),
                      child: new Text(
                        '动态',
                        style: new TextStyle(color: Color(0xFF888888)),
                      ),
                    )),
                    new Expanded(
                        child: Text(
                      "来自：" + item["uid"],
                      textAlign: TextAlign.end,
                      style: new TextStyle(color: Color(0xFF888888)),
                    ))
                  ],
                ),
                new Divider(
                  color: Color(0xFF888888),
                ),

                // Image.network(
                //   item['news_img'],
                //   fit: BoxFit.cover,
                // ),
                item['img_url'] != null && item['img_url'] != ""
                    ? FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: item['img_url'],
                      )
                    : Margin(),

                new Text(
                  item['context'],
                  style: MTextStyles.textBoldDark16,
                  // textAlign: TextAlign.left
                ),
                new Divider(
                  color: Color(0xFF888888),
                ),
              ]))));
    }
    return Column(children: tiles1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          backgroundColor: Colors.white,
          drawer: MyDrawer(),
          //backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            actions: <Widget>[
              GestureDetector(
                  onLongPress: () {
                    print("长按发布纯文本动态");
                    Navigator.pushNamed(context, '/sendtext');
                  },
                  child: IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.black,
                    onPressed: () {
                      print("打开发布动态页面");
                      Navigator.pushNamed(context, '/send');
                    },
                  ))
            ],
            title: Text(
              "首页",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: EasyRefresh(
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TodayKb(),
                BigDivider(),
                buildGrid(),
                buildGridDT()
              ],
            )),
            onRefresh: () async {
               getHttp().then((val) {
      setState(() {
        formList = val.toList();
      });
    });
              getHttp1().then((val) {
                setState(() {
                  formList1 = val.toList();
                });
              });
            },
          )),
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
