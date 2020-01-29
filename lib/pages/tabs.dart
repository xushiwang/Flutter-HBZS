<<<<<<< 4c0dabc26c772d83fdd4c56121a8ce7856c653be
import 'package:flutter/material.dart';
import 'package:hbzs/pages/tabs/MyDrawer.dart';
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
      // drawer: MyDrawer(),
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
=======
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hbzs/pages/tabs/MyDrawer.dart';
import 'tabs/Class.dart';
import 'tabs/Index.dart';
import 'tabs/Me.dart';
import 'tabs/Message.dart';
import 'tabs/Search.dart';
import 'package:hbzs/res/Data.dart';
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
  void dispose() {
    indexcontroller.close();
    super.dispose();
  }

  PageController pageController = PageController(initialPage: 0);
  StreamController<int> indexcontroller = StreamController<int>.broadcast();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          indexcontroller.add(index);
        },
        controller: pageController,
        children: <Widget>[
          Center(
            child: IndexPage(),
          ),
          Center(
            child: ClassPage(),
          ),
          Center(
            child: MessagePage(),
          ),
          Center(
            child: MePage(),
          ),
        ],
      ),
      bottomNavigationBar: StreamBuilder<Object>(
          initialData: 0,
          stream: indexcontroller.stream,
          builder: (context, snapshot) {
            int cIndex = snapshot.data;
            return FancyBottomNavigation(
              currentIndex: cIndex,
              activeColor: Color.fromARGB(255, 207, 169, 114),
              items: <FancyBottomNavigationItem>[
                FancyBottomNavigationItem(
                    icon: Icon(Icons.home), title: Text('首页')),
                FancyBottomNavigationItem(
                    icon: Icon(Icons.dashboard), title: Text('课表')),
                FancyBottomNavigationItem(
                    icon: Icon(Icons.message), title: Text('消息')),
                FancyBottomNavigationItem(
                    icon: Icon(Icons.person), title: Text('我的')),
              ],
              onItemSelected: (int value) {
                indexcontroller.add(value);
                pageController.jumpToPage(value);
              },
            );
          }),
    );
  }
}
class FancyBottomNavigation extends StatefulWidget {
  final int currentIndex;
  final double iconSize;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final List<FancyBottomNavigationItem> items;
  final ValueChanged<int> onItemSelected;

  FancyBottomNavigation(
      {Key key,
      this.currentIndex = 0,
      this.iconSize = 24,
      this.activeColor,
      this.inactiveColor,
      this.backgroundColor,
      @required this.items,
      @required this.onItemSelected}) {
    assert(items != null);
    assert(onItemSelected != null);
  }

  @override
  _FancyBottomNavigationState createState() {
    return _FancyBottomNavigationState(
        items: items,
        backgroundColor: backgroundColor,
        currentIndex: currentIndex,
        iconSize: iconSize,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        onItemSelected: onItemSelected);
  }
}

class _FancyBottomNavigationState extends State<FancyBottomNavigation> {
  final int currentIndex;
  final double iconSize;
  Color activeColor;
  Color inactiveColor;
  Color backgroundColor;
  List<FancyBottomNavigationItem> items;
  int _selectedIndex;
  ValueChanged<int> onItemSelected;

  _FancyBottomNavigationState(
      {@required this.items,
      this.currentIndex,
      this.activeColor,
      this.inactiveColor = Colors.black,
      this.backgroundColor,
      this.iconSize,
      @required this.onItemSelected}) {
    _selectedIndex = currentIndex;
  }

  Widget _buildItem(FancyBottomNavigationItem item, bool isSelected) {
    return AnimatedContainer(
      width: isSelected ? 124 : 50,
      height: double.maxFinite,
      duration: Duration(milliseconds: 250),
      padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              color: activeColor,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconTheme(
                  data: IconThemeData(
                      size: iconSize,
                      color: isSelected ? backgroundColor : inactiveColor),
                  child: item.icon,
                ),
              ),
              isSelected
                  ? DefaultTextStyle.merge(
                      style: TextStyle(color: backgroundColor),
                      child: item.title,
                    )
                  : SizedBox.shrink()
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    activeColor =
        (activeColor == null) ? Theme.of(context).accentColor : activeColor;

    backgroundColor = (backgroundColor == null)
        ? Theme.of(context).bottomAppBarColor
        : backgroundColor;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 56,
      padding: EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
      decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          var index = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              onItemSelected(index);

              setState(() {
                _selectedIndex = index;
              });
            },
            child: _buildItem(item, _selectedIndex == index),
          );
        }).toList(),
      ),
    );
  }
}

class FancyBottomNavigationItem {
  final Icon icon;
  final Text title;

  FancyBottomNavigationItem({
    @required this.icon,
    @required this.title,
  }) {
    assert(icon != null);
    assert(title != null);
  }
>>>>>>> messagfe
}