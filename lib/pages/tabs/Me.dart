import 'package:flutter/material.dart';
import 'package:hbzs/res/MyDrawer.dart';
import 'package:hbzs/res/customview.dart';
import 'package:share/share.dart';
import 'package:hbzs/res/MyListTitle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MePage extends StatefulWidget {
  MePage({Key key}) : super(key: key);

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  var nickname = "";
  @override
  void initState() {
    super.initState();
    this.get_name();
  }

  get_name() async {
    final prefs = await SharedPreferences.getInstance();
    var a = prefs.getString("name");
    if (a != null) {
      setState(() {
        nickname = a;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(nickname, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            color: Colors.black,
            onPressed: () {
              print('分享1');
              Share.share("【海滨助手】\n https://www.hbxy.xyz/");
            },
          )
        ],
      ),
      body: new ListView(
        children: <Widget>[
          Card(),
          BigDivider(),
          Header(), //头部
          BigDivider(),
          MyTitleList(),
          SizedBox(
            height: 20.0,
            child: new Center(
              child: new Container(
                height: 5.0,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            "--- 没有了 ---\n",
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 64.0,
                  height: 64.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://img2.woyaogexing.com/2019/12/28/ebc0f9f2e4bd498283d51d96f878f391!400x400.jpeg"),
                          fit: BoxFit.cover)),
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //昵称
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 25.0),
                      child: Text(
                        '许一生所爱',
                        style: TextStyle(
                            // color: Color(0xFF888888),//浅灰
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    ),
                    //个性签名
                    Container(
                      margin: EdgeInsets.only(left: 25.0, top: 8),
                      child: Text(
                        '我也看到了我应',
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        style: TextStyle(
                          color: Color(0xFF888888), //浅灰
                          //color:Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 100.0,
      color: Colors.white,

      //margin: new EdgeInsets.all(8.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              children: <Widget>[
                //头像
                new Container(
                  width: 60.0,
                  height: 60.0,
                  margin: new EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: new AssetImage('images/kb.png'),
                      //从Assets加载图片
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                new Text(
                  '签到',
                  textAlign: TextAlign.center,
                )
              ],
            ),
            flex: 1,
          ),
          new Expanded(
            child: new Column(
              children: <Widget>[
                //头像
                new Container(
                  width: 60.0,
                  height: 60.0,
                  margin: new EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: new AssetImage('images/cx.png'),
                      //从Assets加载图片
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                new Text(
                  '每日一句',
                  textAlign: TextAlign.center,
                )
              ],
            ),
            flex: 1,
          ),
          new Expanded(
            child: new Column(
              children: <Widget>[
                new Container(
                  width: 60.0,
                  height: 60.0,
                  margin: new EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: new AssetImage('assets/imgs/ic_menu_bus.png'),
                      //从Assets加载图片
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                new Text(
                  '',
                  textAlign: TextAlign.center,
                )
              ],
            ),
            flex: 1,
          ),
          new Expanded(
            child: new Column(
              children: <Widget>[
                //头像
                new Container(
                  width: 60.0,
                  height: 60.0,
                  margin: new EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: new AssetImage('assets/imgs/ic_menu_system.png'),
                      //从Assets加载图片
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                new Text(
                  '校园系统',
                  textAlign: TextAlign.center,
                )
              ],
            ),
            flex: 1,
          ),
          new Expanded(
            child: new Column(
              children: <Widget>[
                //头像
                new Container(
                  width: 60.0,
                  height: 60.0,
                  margin: new EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: new AssetImage('images/wd.png'),
                      //从Assets加载图片
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                new Text(
                  '更多',
                  textAlign: TextAlign.center,
                )
              ],
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
