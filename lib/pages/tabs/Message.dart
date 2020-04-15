
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hbzs/res/Browser.dart';
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
      Response response;
      Dio dio = new Dio();
      response = await dio.get("https://xxzx.bjtuhbxy.edu.cn/wxApplets/spaces/home",queryParameters: {"news":"news"});
      print(response.data);
      return response.data["main_url_list"];
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
          style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.message),
            color: Colors.black,
            onPressed: (){
              Navigator.pushNamed(context, '/chat');
            },
          ),
        ],
      ),
       body:SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Message(),
              buildGrid(),
            ],
          ))
    );
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
            Image.network(
              item['news_img'],
              fit: BoxFit.cover,
            ),
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
