import 'package:hbzs/res/ShowImage.dart';
import 'package:hbzs/res/ShowMD.dart';
import 'package:hbzs/router/Send.dart';
import 'package:hbzs/router/echarts.dart';
import 'package:hbzs/router/list_cet.dart';
import 'package:hbzs/router/list_retest.dart';
import 'package:hbzs/router/list_sorce.dart';
import 'package:hbzs/router/list_test.dart';
import 'package:hbzs/router/Chat.dart';
import 'package:hbzs/router/WebVPN.dart';
import 'package:hbzs/router/editInfo.dart';
import 'package:hbzs/router/about.dart';
import 'package:hbzs/router/loadPage.dart';
import 'package:hbzs/util/nosplash.dart';

import 'pages/tabs.dart';
import 'package:flutter/material.dart';
import 'package:hbzs/router/login.dart';
import 'package:hbzs/router/EveryImage.dart';

import 'res/markdown.dart';
import 'router/private.dart';

//void main() => runApp(MyApp(),SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark););
void main() {
  runApp(MyApp());
  //黑色
  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

//自定义组件需要继承StatelessWidget
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //去掉debug
      theme: Theme.of(context).copyWith(
        highlightColor: Colors.white,
        splashFactory: const NoSplashFactory(),
        accentColor: Colors.white,
        backgroundColor: Colors.white
      ),
      // theme: ThemeData(
      //   primarySwatch: Colors.grey,
      // ),
      
      routes: {
        '/chat': (context) => ChatUi(), //命名路由
        '/send': (context) => SendPage(),
        '/beautiful': (context) => IntroTwoPage(),
        '/login': (context) => Login(),
        '/editinfo': (context) => EditInfo(),
        '/lists': (context) => Lists(),
        '/cet': (context) => List_Cet(),
        '/test': (context) => List_Test(),
        '/retest': (context) => List_ReTest(),
        '/about': (context) => About(),
        '/private':(context)=>Private(),
        '/markdown':(context)=>MarkDown(),
        '/wxpay':(context)=>ShowImage(),
        '/showMD':(context)=>ShowMD(),
        '/echarts':(context)=>Echarts(),
        '/webvpn':(context)=>WebVPN(),
        '/loading':(context)=>LoadPage(),
        '/tabs':(context)=>Tabs()
      },
      home: LoadPage(),
    );
  }
}
