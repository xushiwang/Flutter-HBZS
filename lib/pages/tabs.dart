import 'package:flutter/material.dart';
import 'tabs/Class.dart';
import 'tabs/Index.dart';
import 'tabs/Me.dart';
import 'tabs/Message.dart';
import 'tabs/Search.dart';
class Tabs extends StatefulWidget {
  Tabs({Key key}): super(key: key);
  __TabsState createState() => __TabsState();
}

class __TabsState extends State<Tabs> {
  int _currentIndex=0;
  // List _titleList=[
  //   '首页',
  //   '查询',
  //   '课表',
  //   '消息',
  //   '我的'
  // ];
  List _pageList=[
    IndexPage(),
    SearchPage(),
    ClassPage(),
    MessagePage(),
    MePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold( 
        backgroundColor: Colors.white,
        // backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Text('海滨助手'),
        //   backgroundColor: Color.fromARGB(255, 216,30, 6),//网易红
        // ),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        currentIndex: _currentIndex,
        onTap: (int index){
          print(index);
          setState(() {
            this._currentIndex=index;
          });
        },
        type: BottomNavigationBarType.fixed,
        //fixedColor: Color.fromARGB(255, 224, 175, 46),//金黄
        fixedColor: Color.fromARGB(255, 216,30, 6),//网易云红
        items:[
          BottomNavigationBarItem(
            icon: Image.asset('images/dt0.png'),
            activeIcon: Image.asset('images/dt.png'),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/cx0.png'),
            title: Text('查询'),
            activeIcon: Image.asset('images/cx.png'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/kb0.png'),
            title: Text('课表'),
            activeIcon: Image.asset('images/kb.png'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/xx0.png'),
            title: Text('信息'),
            activeIcon: Image.asset('images/xx.png')
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/wd0.png'),
            title: Text('我的'),
            activeIcon: Image.asset('images/wd.png'),
          )
        ]
      ),
      ),
    );
  }
}