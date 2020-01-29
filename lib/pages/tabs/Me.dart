<<<<<<< 4c0dabc26c772d83fdd4c56121a8ce7856c653be

import 'package:flutter/material.dart';
import 'package:hbzs/pages/tabs/MyDrawer.dart';
import 'package:hbzs/res/customview.dart';
import 'package:hbzs/res/meData.dart';

class MePage extends StatefulWidget {
  MePage({Key key}) : super(key: key);

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MyDrawer(),
      appBar: AppBar(
        title:Text(
          '许仕旺',
          style: TextStyle(color: Colors.black)
        ),
        backgroundColor: Colors.white,
        // backgroundColor: Color.fromARGB(255, 216,30, 6),//网易红
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   color: Colors.grey,
        //   onPressed: (){
        //     print('打开个人中心');
        //   },
        // ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            color: Colors.black,
            onPressed: (){
              print('分享1');
            },
          )
        ],
      ),
      //backgroundColor: Colors.white,
      // body: Container(
      //   color: Colors.white,
      //   child: ListView(
      //     children: this._getData()
      //   )
      // ),
      
      body: new ListView(
          children: <Widget>[
            Card(),
            BigDivider(),
            Header(),     //头部
            BigDivider(),
            BigDivider(),
            //new Message(),    //消息
            
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
                      image: NetworkImage("https://img2.woyaogexing.com/2019/12/28/ebc0f9f2e4bd498283d51d96f878f391!400x400.jpeg"),
                      fit: BoxFit.cover
                    )
                ),
                ),
                
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //昵称
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 25.0),
                      child:Text(
                        '许一生所爱',
                        style:TextStyle(
                          // color: Color(0xFF888888),//浅灰
                          color:Colors.black,
                          fontSize: 16
                        ),
                      ),
                    ),
                    //个性签名
                    Container(
                      margin: EdgeInsets.only(left: 25.0,top: 8),
                      child:Text(
                        '我也看到了我应该看到的东西，我也会铭记你一辈子sdfsdf',
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        style:TextStyle(
                        color: Color(0xFF888888),//浅灰
                        //color:Colors.black,
                        fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                

                // new Container(
                //   margin: EdgeInsets.only(left: 25.0,top: 0),
                //   child:Text(
                //     '许仕旺',
                //     style:TextStyle(
                //       // color: Color(0xFF888888),//浅灰
                //       color:Colors.black,
                //       fontSize: 16
                //     ),
                //   ),
                // ),


              ],
            ),
          )
        ],
      ),
    );
  }
}
class Header extends StatelessWidget {

  List<Widget> _getData(){
    var tempList = meData.map((value){
      return ListTile(
        leading: Image.network(value['imageUrl']),
        title: Text(value["title"]),
        subtitle: Text(value["author"]),
      );
    });
    return tempList.toList();
  }

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
                  '查成绩',
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
                  '查体育',
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
                      image: new AssetImage('assets/imgs/ic_menu_bus.png'),
                      //从Assets加载图片
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                new Text(
                  '查校车',
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

=======

import 'package:flutter/material.dart';
import 'package:hbzs/pages/tabs/MyDrawer.dart';
import 'package:hbzs/res/customview.dart';
import 'package:share/share.dart';
import 'package:hbzs/pages/MePage/MyListTitle.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MePage extends StatefulWidget {
  MePage({Key key}) : super(key: key);

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  var nickname="";
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    this.get_name();
  }
   get_name() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nickname = prefs.getString("name");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer:MyDrawer(),
      appBar: AppBar(
        title:Text(
          nickname,
          style: TextStyle(color: Colors.black)
        ),
        backgroundColor: Colors.white,
        // backgroundColor: Color.fromARGB(255, 216,30, 6),//网易红
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   color: Colors.grey,
        //   onPressed: (){
        //     print('打开个人中心');
        //   },
        // ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            color: Colors.black,
            onPressed: (){
              print('分享1');
              Share.share("【海滨助手】\n https://www.hbxy.xyz/");
            },
          )
        ],
      ),
      //backgroundColor: Colors.white,
      // body: Container(
      //   color: Colors.white,
      //   child: ListView(
      //     children: this._getData()
      //   )
      // ),
      
      body: new ListView(
          children: <Widget>[
            Card(),
            BigDivider(),
            Header(),     //头部
            BigDivider(),
            MyTitleList()
            //new Message(),    //消息
            
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
                      image: NetworkImage("https://img2.woyaogexing.com/2019/12/28/ebc0f9f2e4bd498283d51d96f878f391!400x400.jpeg"),
                      fit: BoxFit.cover
                    )
                ),
                ),
                
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //昵称
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 25.0),
                      child:Text(
                        '许一生所爱',
                        style:TextStyle(
                          // color: Color(0xFF888888),//浅灰
                          color:Colors.black,
                          fontSize: 16
                        ),
                      ),
                    ),
                    //个性签名
                    Container(
                      margin: EdgeInsets.only(left: 25.0,top: 8),
                      child:Text(
                        '我也看到了我应',
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        style:TextStyle(
                        color: Color(0xFF888888),//浅灰
                        //color:Colors.black,
                        fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                

                // new Container(
                //   margin: EdgeInsets.only(left: 25.0,top: 0),
                //   child:Text(
                //     '许仕旺',
                //     style:TextStyle(
                //       // color: Color(0xFF888888),//浅灰
                //       color:Colors.black,
                //       fontSize: 16
                //     ),
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
class Header extends StatelessWidget {

  // List<Widget> _getData(){
  //   var tempList = meData.map((value){
  //     return ListTile(
  //       leading: Image.network(value['imageUrl']),
  //       title: Text(value["title"]),
  //       subtitle: Text(value["author"]),
  //     );
  //   });
  //   return tempList.toList();
  // }

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
                //头像
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

>>>>>>> messagfe
