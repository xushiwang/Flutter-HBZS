import 'package:flutter/material.dart';
import 'package:hbzs/res/MyDrawer.dart';
import 'package:hbzs/res/customview.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.white,
        //drawerScrimColor: Colors.transparent.withOpacity(0.8),
        drawer: MyDrawer(),
        //backgroundColor: Colors.white,
        appBar: AppBar(
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
  Map data = {
	"cont": 3,
	"main_url_list": [
		{
			"content": "寒假在即，为全面做好我校安全稳定工作，加强寒假期...",
			"author": "宣传统战部",
			"title": "我校开展2019——2020学年寒假前校园安全大检查",
			"news_img": "http://www.bjtuhbxy.cn/__local/4/0E/B8/A34C4362E293302E620689E77B4_49F19397_169CA.jpg",
			"news_time": "2020年01月07日 11:46",
			"href": "info/1065/4675.htm"
		},
		{
			"content": "1月2日下午，我校于行政楼二楼会议室召开2019年度教...",
			"author": "宣传统战部",
			"title": "我校召开2019年度教学督导工作总结会议",
			"news_img": "http://www.bjtuhbxy.cn/__local/3/E7/A3/5766BD9AACAAF37B4A3B69B28A8_655BAAF2_15068.png",
			"news_time": "2020年01月02日 23:47",
			"href": "info/1065/4672.htm"
		},
		{
			"content": "​",
			"author": "宣传统战部",
			"title": "北京交通大学海滨学院2020年新年献词",
			"news_img": "http://www.bjtuhbxy.cn/__local/0/F6/78/03D6786125A3FE277CEB7C79F31_1DEBC611_176EF.jpg",
			"news_time": "2019年12月31日 22:50",
			"href": "info/1065/4670.htm"
		}
	]
};
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
                data == null
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        child: ListView.builder(
                            itemCount: data["main_url_list"].length(),
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: <Widget>[
                                  new Text(
                                    '2018/09/14',
                                    style:
                                        new TextStyle(color: Color(0xFF888888)),
                                  ),
                                  new Margin(indent: 6.0),
                                  new Image(
                                      image: new NetworkImage(
                                      "")),
                                  new Margin(indent: 6.0),
                                  new Text(
                                    data["main_url_list"]["title"],
                                    style:
                                        new TextStyle(color: Color(0xFF888888)),
                                  ),
                                ],
                              );
                            }))
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

  Dongtai() {}
}
