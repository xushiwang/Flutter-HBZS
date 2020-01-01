import 'dart:io';

import 'pages/tabs.dart';
import 'package:flutter/material.dart';
import 'pages/MePage/EditPage.dart';
void main() => runApp(MyApp());


//自定义组件需要继承StatelessWidget
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//去掉debug
       theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the consoluge where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
      ),
      routes: {
        '/edit':(context)=>EditPage(),//命名路由
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
// }



