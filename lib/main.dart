import 'package:flutter/services.dart';
import 'package:hbzs/router/Send.dart';
import 'package:hbzs/router/list_cet.dart';
import 'package:hbzs/router/list_retest.dart';
import 'package:hbzs/router/list_sorce.dart';
import 'package:hbzs/router/list_test.dart';
import 'package:hbzs/router/Chat.dart';
import 'package:hbzs/router/editInfo.dart';
import 'package:hbzs/router/about.dart';
import 'package:hbzs/util/nosplash.dart';

import 'pages/tabs.dart';
import 'package:flutter/material.dart';
import 'package:hbzs/router/login.dart';
import 'package:hbzs/router/EveryImage.dart';

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
        highlightColor: Colors.transparent,
        splashFactory: const NoSplashFactory(),
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
      },
      home: Tabs(),
    );
  }
}

// class HomeContext  extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         child:Image.network(
//           'https://www.hbxy.xyz/images/1.jpg',
//           alignment: Alignment.center,
//           color: Colors.purple,
//           colorBlendMode: BlendMode.colorDodge,
//           fit: BoxFit.cover,//显示方式
//           ),
//         // child: Text(
//         //   '我是一个文本我是一个文本我是一个文本我是一个文本我是一个文本我是一个文本我是一个文本我是一个文本我是一个文本我是一个文本我是一个文本',
//         //   textAlign: TextAlign.left,
//         //   style: TextStyle(
//         //     fontSize: 16.0,
//         //     color: Color.fromARGB(255, 255, 255, 255),
//         //     decorationColor: Colors.white
//         //   ),
//         //   overflow: TextOverflow.ellipsis,
//         //   maxLines: 1,//最大行数
//         //   textScaleFactor: 2,//放大倍数
//         // ),

//         height: 300.0,
//         width: 300.0,
//         decoration: BoxDecoration(
//           color: Colors.pink,
//           border: Border.all(
//             color: Colors.blue,
//             width: 2.0
//             ),
//           borderRadius: BorderRadius.all(
//             Radius.circular(20)
//           )
//         ),
//         padding: EdgeInsets.all(10.0),
//         transform: Matrix4.rotationZ(0.3),
//       ),
//     );
//   }
