import 'package:flutter/material.dart';
import 'package:hbzs/common/global.dart';
import 'package:hbzs/res/MyDrawer.dart';
import 'package:hbzs/res/customview.dart';
import 'package:share/share.dart';
import 'package:hbzs/res/MyListTitle.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

class MePage extends StatefulWidget {
  final String avator_url;
  MePage({Key key,this.avator_url}) : super(key: key);
  
  @override
  _MePageState createState() => _MePageState();
}
 String _avator=Global.avator_img_url;
class _MePageState extends State<MePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(Global.nickname, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            color: Colors.black,
            onPressed: () {
              Share.share("【海滨助手】\n"+Global.app_url);
            },
          )
        ],
      ),
      body: new ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print("点击了头像->编辑个人信息");
              Navigator.pushNamed(context, '/avator');
            },
            child: Card(),
          ),
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
            style: TextStyle(color: Colors.black, fontSize: 10),
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
                             Global.avator_img_url),
                          fit: BoxFit.cover)),
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(children: <Widget>[
                      SizedBox(width:25),
                      Image.asset("images/vip_s.png",width: true?16:0),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 3.0),
                        child: Text(
                          Global.nickname,
                          style: TextStyle(
                              // color: Color(0xFF888888),//浅灰
                              color: Colors.black,
                              fontSize: 16),
                        ),
                      ),
                    ]),
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
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 60.0,
                    height: 60.0,
                    margin: new EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: new AssetImage('images/title_0.png'),
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
              onTap: () {
                print("1");
                print(FlutterAppBadger.isAppBadgeSupported());
                FlutterAppBadger.updateBadgeCount(1);
              },
            ),
            flex: 1,
          ),
          new Expanded(
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 60.0,
                    height: 60.0,
                    margin: new EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: new AssetImage('images/title.png'),
                        //从Assets加载图片
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  new Text(
                    '校历查询',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              onTap: () {
                print("2");
              },
            ),
            flex: 1,
          ),
          new Expanded(
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 60.0,
                    height: 60.0,
                    margin: new EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: new AssetImage('images/title_3.png'),
                        //从Assets加载图片
                        fit: BoxFit.fitWidth,
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
              onTap: () {
                print("1");
              },
            ),
            flex: 1,
          ),
          new Expanded(
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 60.0,
                    height: 60.0,
                    margin: new EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: new AssetImage('images/title_4.png'),
                        //从Assets加载图片
                        fit: BoxFit.contain
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
              onTap: () {
                print("1");
              },
            ),
            flex: 1,
          ),
          new Expanded(
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 60.0,
                    height: 60.0,
                    margin: new EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: new AssetImage('images/title_5.png'),
                        //从Assets加载图片
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  new Text(
                    '精选好物',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              onTap: () {
                print("5");
              },
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
