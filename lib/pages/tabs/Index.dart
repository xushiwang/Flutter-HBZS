import 'package:flutter/material.dart';
import 'package:hbzs/res/customview.dart';
class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon:Icon(Icons.menu),
            color: Colors.black,
            onPressed: (){
              print("添加好友");
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.black,
              onPressed: (){
                print("打开发布动态页面");
              },
            )
          ],
          title: Text(
            "首页",
            style: TextStyle(
              color: Colors.black
              ),
            ),
          centerTitle: true,
          ),
        body: Layout(),
      ),
    );
  }
}
class Layout extends StatelessWidget {
  const Layout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TodayKb(),
        BigDivider(),
        new One(),
        new One(),
      ],
    );
  }
}

class TodayKb extends StatelessWidget {
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
                  Icons.camera,
                  color: Colors.black26,
                  size: 17.0,
                ),
                new Container(
                  margin: new EdgeInsets.only(left: 5.0),
                  child: new Text(
                    '今日课表',
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
            margin: new EdgeInsets.only(top: 30.0, bottom: 2.0),
            child: new Text("今天居然没有课~" + "\uD83D\uDE01"),
          ),
          new Container(
            margin: new EdgeInsets.only(top: 30.0, bottom: 2.0),
            child: new Text('点我查看完整课表',
                style: new TextStyle(
                    color: Color(
                      0xFF888888,
                    ),
                    fontSize: 12.0)),
          ),
        ],
      ),
    );
  }
}

class One extends StatelessWidget {
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
                  Icons.ac_unit,
                  color: Colors.black26,
                  size: 17.0,
                ),
                new Container(
                  margin: new EdgeInsets.only(left: 5.0),
                  child: new Text(
                    '动态',
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
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  '2018/09/14',
                  style: new TextStyle(color: Color(0xFF888888)),
                ),
                new Margin(indent: 6.0),
                new Image(
                    image: new NetworkImage(
                        'http://image.wufazhuce.com/Fn5E1UnrcvN0jwFRiOtDZ2WnQa4N')),
                new Margin(indent: 6.0),
                new Text(
                  'Fahmi Ramadhan | 摄影',
                  style: new TextStyle(color: Color(0xFF888888)),
                ),
                new Margin(indent: 6.0),
                new Text(
                  '所有的爱情，都是两个心灵相通的人胜利，无法相互了解的人失败，没有所谓对错。',
                  textAlign: TextAlign.center,
                  style: new TextStyle(color: Color(0xFF888888)),
                ),
                new Margin(indent: 6.0),
                new Text(
                  '《东京爱情故事》',
                  style: new TextStyle(color: Color(0xFF888888)),
                )
              ],
            ),
          ),
          new Divider(
            color: Color(0xFF888888),
          )
        ],
      ),
    );
  }
}