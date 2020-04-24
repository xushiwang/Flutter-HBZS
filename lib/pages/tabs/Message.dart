import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hbzs/model/User.dart';
import 'package:hbzs/res/Browser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
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
      User a = new User('16851144', "sd");
      Response response;
      Dio dio = new Dio();
      Map<String, String> map = {'uid':a.account};
      FormData formData = FormData.fromMap(map);
      response = await dio.post(
          "http://192.168.1.114:8080/admin.php?c=Notify&a=index",
          data: formData);
      print(response.data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            '消息',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.message),
              color: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, '/chat');
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Message(),
            buildGrid(),
          ],
        )));
  }

  Widget buildGrid() {
    List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
    for (var item in formList) {
      tiles.add(new Container(
          margin: new EdgeInsets.all(20),
          child: GestureDetector(
              onTap: () {
                if (item["url"] != "") {
                  Navigator.of(context)
                      .push(new MaterialPageRoute(builder: (_) {
                    return Browser(
                      url: item["url"],
                      title: "通知详情",
                    );
                  }));
                }
              },
              child: Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    new Icon(
                      Icons.message,
                      color: Colors.black26,
                      size: 17.0,
                    ),
                    new Container(
                      margin: new EdgeInsets.only(left: 5.0),
                      child: new Text(
                        '系统消息',
                        style: new TextStyle(color: Color(0xFF888888)),
                      ),
                    ),
                    new Expanded(
                        child: Text(
                      "发送人：" + item["send_from"],
                      textAlign: TextAlign.end,
                    ))
                  ],
                ),
                new Divider(
                  color: Color(0xFF888888),
                ),
                new Text(
                  "消息内容：" + item['context'],
                  textAlign: TextAlign.left,
                  style: new TextStyle(color: Colors.black),
                ),
                new Divider(
                  color: Color(0xFF888888),
                ),
                new Row(children: <Widget>[
                  new Expanded(
                      child: Text(
                    "发送时间：" + item["send_at"],
                    textAlign: TextAlign.end,
                  )),
                  // new Expanded(
                  //   child
                  // )
                ]),
                new SizedBox(height: 5),
              ]))));
    }
    return Column(children: tiles);
  }
}

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.all(18.0),
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Row(
              children: <Widget>[
                new Icon(
                  Icons.message,
                  color: Colors.black26,
                  size: 17.0,
                ),
                new Container(
                  margin: new EdgeInsets.only(left: 5.0),
                  child: new Text(
                    '消息',
                    style: new TextStyle(color: Color(0xFF888888)),
                  ),
                )
              ],
            ),
          ),
          new Divider(
            color: Color(0xFF888888),
          ),
          new Container(
            margin: new EdgeInsets.all(10.0),
            child: new Text("这里是消息"),
          ),
          new Divider(
            color: Color(0xFF888888),
          )
        ],
      ),
    );
  }
}
