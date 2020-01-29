<<<<<<< 4c0dabc26c772d83fdd4c56121a8ce7856c653be
import 'package:flutter/material.dart';
import 'package:hbzs/res/classData.dart';

class ClassPage extends StatefulWidget {
  ClassPage({Key key}) : super(key: key);

  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  List<Widget> _getListData(){
    //var tempInit=[{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}];
    var tempList =classData.map((value){
      return Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              value['keming']+value['didian'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12
              ),
              )
          ],
        ),

        decoration: BoxDecoration(
          border: Border.all(
            color:Color.fromRGBO(233, 233, 233, 0.9),
            width: 2
          )
        ),
      );
    });
    return tempList.toList();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "第十六周",
              style: TextStyle(
                color: Colors.black,
              ),),
            bottom: TabBar(
              indicatorColor: Color.fromARGB(255, 216,30, 6),//指示器颜色
              labelColor: Color.fromARGB(255, 216,30, 6),
              // labelStyle: TextStyle(
              //   color: Color.fromARGB(255, 216,30, 6)
              //   ),//网易红
              unselectedLabelColor: Colors.black,
              indicatorWeight: 2.0,
              tabs: <Widget>[
                Tab(text: "我的课表"),
                Tab(text: "ta的课表"),
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            //first 
            GridView.count(
              // crossAxisSpacing: 1.0,//左右间距
              // mainAxisSpacing: 1.0,//上下间距
              crossAxisCount: 6,
              //padding: EdgeInsets.all(10),//四周缩进
              children: this._getListData(),
              childAspectRatio: 0.7,//长：宽比例
            ),
            //secont
            GridView.count(
              // crossAxisSpacing: 1.0,//左右间距
              // mainAxisSpacing: 1.0,//上下间距
              crossAxisCount: 6,
              //padding: EdgeInsets.all(10),//四周缩进
              children: this._getListData(),
              childAspectRatio: 0.7,//长：宽比例
            ),
          ]
        ),
        //   appBar: AppBar(
        //   leading: Image.network('https://img2.woyaogexing.com/2019/12/28/ebc0f9f2e4bd498283d51d96f878f391!400x400.jpeg'),
        //   title: ButtonBar(),
        //     backgroundColor: Color.fromRGBO(216, 30, 36, 0.8),
        //   ),
        // body: Text('sdf')
        ),
      ),
    );
  }
}
=======
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hbzs/model/kb_data.dart';
import 'package:hbzs/res/Data.dart';
import 'package:flutter/material.dart';
import 'package:hbzs/model/getweek.dart';
import 'package:hbzs/res/classData.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ClassPage extends StatefulWidget {
  @override
  ClassPage({Key key}) : super(key: key);
  @override
  _ClassPageState createState() => _ClassPageState();
}

var _week = "";
var DATA;

class _ClassPageState extends State<ClassPage> {
  @override
  void initState() {
    super.initState();
    this._getData();
    this.Net();
  }

  List<Widget> _getListData() {
    var tempList = classData.map((value) {
      return Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              value['keming'] + value['didian'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        decoration: BoxDecoration(
            border: Border.all(
                color: Color.fromRGBO(233, 233, 233, 0.9), width: 2)),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              _week.toString(),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            bottom: TabBar(
              indicatorColor: Color.fromARGB(255, 207, 169, 114), //指示器颜色
              labelColor: Color.fromARGB(255, 207, 169, 114),
              unselectedLabelColor: Colors.black,
              indicatorWeight: 3.0,
              tabs: <Widget>[
                Tab(text: "我的课表"),
                Tab(text: "ta的课表"),
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            //first
            GridView.count(
              // crossAxisSpacing: 1.0,//左右间距
              // mainAxisSpacing: 1.0,//上下间距
              crossAxisCount: 7,
              //padding: EdgeInsets.all(10),//四周缩进
              children: this._getListData(),
              childAspectRatio: 0.7, //长：宽比例
            ),
            //secont
            GridView.count(
              // crossAxisSpacing: 1.0,//左右间距
              // mainAxisSpacing: 1.0,//上下间距
              crossAxisCount: 7,
              //padding: EdgeInsets.all(10),//四周缩进
              children: this._getListData(),
              childAspectRatio: 0.7, //长：宽比例
            ),
          ]),
        ),
      ),
    );
  }

  _getData() async {
    print("获取周次信息");
    Dio dio = new Dio();
    Response response = await dio.get("https://xxzx.bjtuhbxy.edu.cn/get_week");
    if (response.statusCode == 200) {
      if (json.decode(response.data)["flag"] == 1) {
        setState(() {
          _week = "第" + json.decode(response.data)["interval"].toString() + "周";
        });
      } else {
        setState(() {
          _week = "当前为非教学周";
        });
      }
    } else {
      print("获取周次信息失败");
      print(response.statusCode);
    }
  }

  Future<void> Net() async {
    print("获取课表信息");
    final prefs = await SharedPreferences.getInstance();

    FormData params = new FormData.from({
      'name': "kb",
      'account': prefs.getString("account"),
      'numb': prefs.getString("secret")
    });
    //print(params);
    Dio dio = new Dio();
    Response response = await dio
        .post("https://xxzx.bjtuhbxy.edu.cn/login/main/get_kb", data: params);
    if (response.statusCode == 200) {
      Map DATA1 = json.decode(response.data);
      Map<String, dynamic> map = DATA1;
      KbData data = KbData.fromJson(map);
      if (data.kbFlag == 1) {
        //print(info.information);
        print(data.information.xy); //班级
        print(data.information.zy);
        print(data.information.bj);
        print(data.information.xm);
        print(data.information.xh);
        print(data.information.xn);
        print(data.information.xq);
        if (data.kb.mon1.kbFlag != 0) {
          for (int i = 0; i < data.kb.mon1.classCurrent.length; i++) {
            print("teacher:" + data.kb.mon1.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.mon1.classCurrent[i].location.toString());
            print("course:" + data.kb.mon1.classCurrent[i].course.toString());
            print("time:" + data.kb.mon1.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.mon1.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.mon1.classCurrent[i].start.toString());
            print("end:" + data.kb.mon1.classCurrent[i].end.toString());
          }
        }
        if (data.kb.mon2.kbFlag != 0) {
          for (int i = 0; i < data.kb.mon2.classCurrent.length; i++) {
            print("teacher:" + data.kb.mon2.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.mon2.classCurrent[i].location.toString());
            print("course:" + data.kb.mon2.classCurrent[i].course.toString());
            print("time:" + data.kb.mon2.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.mon2.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.mon2.classCurrent[i].start.toString());
            print("end:" + data.kb.mon2.classCurrent[0].end.toString());
          }
        }
        if (data.kb.mon3.kbFlag != 0) {
          for (int i = 0; i < data.kb.mon3.classCurrent.length; i++) {
            print("teacher:" + data.kb.mon3.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.mon3.classCurrent[i].location.toString());
            print("course:" + data.kb.mon3.classCurrent[i].course.toString());
            print("time:" + data.kb.mon3.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.mon3.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.mon3.classCurrent[i].start.toString());
            print("end:" + data.kb.mon3.classCurrent[i].end.toString());
          }
        }
        if (data.kb.mon4.kbFlag != 0) {
          for (int i = 0; i < data.kb.mon4.classCurrent.length; i++) {
            print("teacher:" + data.kb.mon4.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.mon4.classCurrent[i].location.toString());
            print("course:" + data.kb.mon4.classCurrent[i].course.toString());
            print("time:" + data.kb.mon4.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.mon4.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.mon4.classCurrent[i].start.toString());
            print("end:" + data.kb.mon4.classCurrent[i].end.toString());
          }
        }
        if (data.kb.mon5.kbFlag != 0) {
          for (int i = 0; i < data.kb.mon1.classCurrent.length; i++) {
            print("teacher:" + data.kb.mon5.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.mon5.classCurrent[i].location.toString());
            print("course:" + data.kb.mon5.classCurrent[i].course.toString());
            print("time:" + data.kb.mon5.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.mon5.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.mon5.classCurrent[i].start.toString());
            print("end:" + data.kb.mon5.classCurrent[i].end.toString());
          }
        }
        if (data.kb.tues1.kbFlag != 0) {
          for (int i = 0; i < data.kb.tues1.classCurrent.length; i++) {
            print(
                "teacher:" + data.kb.tues1.classCurrent[i].teacher.toString());
            print("location:" +
                data.kb.tues1.classCurrent[i].location.toString());
            print("course:" + data.kb.tues1.classCurrent[i].course.toString());
            print("time:" + data.kb.tues1.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.tues1.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.tues1.classCurrent[i].start.toString());
            print("end:" + data.kb.tues1.classCurrent[i].end.toString());
          }
        }
        if (data.kb.tues2.kbFlag != 0) {
          for (int i = 0; i < data.kb.tues2.classCurrent.length; i++) {
            print(
                "teacher:" + data.kb.tues2.classCurrent[i].teacher.toString());
            print("location:" +
                data.kb.tues2.classCurrent[i].location.toString());
            print("course:" + data.kb.tues2.classCurrent[i].course.toString());
            print("time:" + data.kb.tues2.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.tues2.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.tues2.classCurrent[i].start.toString());
            print("end:" + data.kb.tues2.classCurrent[i].end.toString());
          }
        }
        if (data.kb.tues3.kbFlag != 0) {
          for (int i = 0; i < data.kb.tues3.classCurrent.length; i++) {
            print(
                "teacher:" + data.kb.tues3.classCurrent[i].teacher.toString());
            print("location:" +
                data.kb.tues3.classCurrent[i].location.toString());
            print("course:" + data.kb.tues3.classCurrent[i].course.toString());
            print("time:" + data.kb.tues3.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.tues3.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.tues3.classCurrent[i].start.toString());
            print("end:" + data.kb.tues3.classCurrent[i].end.toString());
          }
        }
        if (data.kb.tues4.kbFlag != 0) {
          for (int i = 0; i < data.kb.tues4.classCurrent.length; i++) {
            print(
                "teacher:" + data.kb.tues4.classCurrent[i].teacher.toString());
            print("location:" +
                data.kb.tues4.classCurrent[i].location.toString());
            print("course:" + data.kb.tues4.classCurrent[i].course.toString());
            print("time:" + data.kb.tues4.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.tues4.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.tues4.classCurrent[i].start.toString());
            print("end:" + data.kb.tues4.classCurrent[i].end.toString());
          }
        }
        if (data.kb.tues5.kbFlag != 0) {
          for (int i = 0; i < data.kb.tues5.classCurrent.length; i++) {
            print(
                "teacher:" + data.kb.tues5.classCurrent[i].teacher.toString());
            print("location:" +
                data.kb.tues5.classCurrent[i].location.toString());
            print("course:" + data.kb.tues5.classCurrent[i].course.toString());
            print("time:" + data.kb.tues5.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.tues5.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.tues5.classCurrent[i].start.toString());
            print("end:" + data.kb.tues5.classCurrent[i].end.toString());
          }
        }
        if (data.kb.wed1.kbFlag != 0) {
          for (int i = 0; i < data.kb.wed1.classCurrent.length; i++) {
            print("teacher:" + data.kb.wed1.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.wed1.classCurrent[i].location.toString());
            print("course:" + data.kb.wed1.classCurrent[i].course.toString());
            print("time:" + data.kb.wed1.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.wed1.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.wed1.classCurrent[i].start.toString());
            print("end:" + data.kb.wed1.classCurrent[i].end.toString());
          }
        }
        if (data.kb.wed2.kbFlag != 0) {
          for (int i = 0; i < data.kb.wed2.classCurrent.length; i++) {
            print("teacher:" + data.kb.wed2.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.wed2.classCurrent[i].location.toString());
            print("course:" + data.kb.wed2.classCurrent[i].course.toString());
            print("time:" + data.kb.wed2.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.wed2.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.wed2.classCurrent[i].start.toString());
            print("end:" + data.kb.wed2.classCurrent[i].end.toString());
          }
        }
        if (data.kb.wed3.kbFlag != 0) {
          for (int i = 0; i < data.kb.wed3.classCurrent.length; i++) {
            print("teacher:" + data.kb.wed3.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.wed3.classCurrent[i].location.toString());
            print("course:" + data.kb.wed3.classCurrent[i].course.toString());
            print("time:" + data.kb.wed3.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.wed3.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.wed3.classCurrent[i].start.toString());
            print("end:" + data.kb.wed3.classCurrent[i].end.toString());
          }
        }
        if (data.kb.wed4.kbFlag != 0) {
          for (int i = 0; i < data.kb.wed4.classCurrent.length; i++) {
            print(data.kb.wed4.classCurrent[i].toString());
            print("teacher:" + data.kb.wed4.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.wed4.classCurrent[i].location.toString());
            print("course:" + data.kb.wed4.classCurrent[i].course.toString());
            print("time:" + data.kb.wed4.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.wed4.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.wed4.classCurrent[i].start.toString());
            print("end:" + data.kb.wed4.classCurrent[i].end.toString());
          }
        }
        if (data.kb.wed5.kbFlag != 0) {
          for (int i = 0; i < data.kb.wed5.classCurrent.length; i++) {
            print("teacher:" + data.kb.wed5.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.wed5.classCurrent[i].location.toString());
            print("course:" + data.kb.wed5.classCurrent[i].course.toString());
            print("time:" + data.kb.wed5.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.wed5.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.wed5.classCurrent[i].start.toString());
            print("end:" + data.kb.wed5.classCurrent[i].end.toString());
          }
        }
        if (data.kb.thur1.kbFlag != 0) {
          for (int i = 0; i < data.kb.thur1.classCurrent.length; i++) {
            print(
                "teacher:" + data.kb.thur1.classCurrent[i].teacher.toString());
            print("location:" +
                data.kb.thur1.classCurrent[i].location.toString());
            print("course:" + data.kb.thur1.classCurrent[i].course.toString());
            print("time:" + data.kb.thur1.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.thur1.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.thur1.classCurrent[i].start.toString());
            print("end:" + data.kb.thur1.classCurrent[i].end.toString());
          }
        }
        if (data.kb.thur2.kbFlag != 0) {
          for (int i = 0; i < data.kb.thur2.classCurrent.length; i++) {
            print(
                "teacher:" + data.kb.thur2.classCurrent[i].teacher.toString());
            print("location:" +
                data.kb.thur2.classCurrent[i].location.toString());
            print("course:" + data.kb.thur2.classCurrent[i].course.toString());
            print("time:" + data.kb.thur2.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.thur2.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.thur2.classCurrent[i].start.toString());
            print("end:" + data.kb.thur2.classCurrent[i].end.toString());
          }
        }
        if (data.kb.thur3.kbFlag != 0) {
          for (int i = 0; i < data.kb.thur3.classCurrent.length; i++) {
            print(
                "teacher:" + data.kb.thur3.classCurrent[i].teacher.toString());
            print("location:" +
                data.kb.thur3.classCurrent[i].location.toString());
            print("course:" + data.kb.thur3.classCurrent[i].course.toString());
            print("time:" + data.kb.thur3.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.thur3.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.thur3.classCurrent[i].start.toString());
            print("end:" + data.kb.thur3.classCurrent[i].end.toString());
          }
        }
        if (data.kb.thur4.kbFlag != 0) {
          for (int i = 0; i < data.kb.thur4.classCurrent.length; i++) {
            print(
                "teacher:" + data.kb.thur4.classCurrent[i].teacher.toString());
            print("location:" +
                data.kb.thur4.classCurrent[i].location.toString());
            print("course:" + data.kb.thur4.classCurrent[i].course.toString());
            print("time:" + data.kb.thur4.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.thur4.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.thur4.classCurrent[i].start.toString());
            print("end:" + data.kb.thur4.classCurrent[i].end.toString());
          }
        }
        if (data.kb.thur5.kbFlag != 0) {
          for (int i = 0; i < data.kb.thur5.classCurrent.length; i++) {
            print(
                "teacher:" + data.kb.thur5.classCurrent[i].teacher.toString());
            print("location:" +
                data.kb.thur5.classCurrent[i].location.toString());
            print("course:" + data.kb.thur5.classCurrent[i].course.toString());
            print("time:" + data.kb.thur5.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.thur5.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.thur5.classCurrent[i].start.toString());
            print("end:" + data.kb.thur5.classCurrent[i].end.toString());
          }
        }
        if (data.kb.fri1.kbFlag != 0) {
          for (int i = 0; i < data.kb.fri1.classCurrent.length; i++) {
            print("teacher:" + data.kb.fri1.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.fri1.classCurrent[i].location.toString());
            print("course:" + data.kb.fri1.classCurrent[i].course.toString());
            print("time:" + data.kb.fri1.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.fri1.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.fri1.classCurrent[i].start.toString());
            print("end:" + data.kb.fri1.classCurrent[i].end.toString());
          }
        }
        if (data.kb.fri2.kbFlag != 0) {
          for (int i = 0; i < data.kb.fri2.classCurrent.length; i++) {
            print("teacher:" + data.kb.fri2.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.fri2.classCurrent[i].location.toString());
            print("course:" + data.kb.fri2.classCurrent[i].course.toString());
            print("time:" + data.kb.fri2.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.fri2.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.fri2.classCurrent[i].start.toString());
            print("end:" + data.kb.fri2.classCurrent[i].end.toString());
          }
        }
        if (data.kb.fri3.kbFlag != 0) {
          for (int i = 0; i < data.kb.fri3.classCurrent.length; i++) {
            print("teacher:" + data.kb.fri3.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.fri3.classCurrent[i].location.toString());
            print("course:" + data.kb.fri3.classCurrent[i].course.toString());
            print("time:" + data.kb.fri3.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.fri3.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.fri3.classCurrent[i].start.toString());
            print("end:" + data.kb.fri3.classCurrent[i].end.toString());
          }
        }
        if (data.kb.fri4.kbFlag != 0) {
          for (int i = 0; i < data.kb.fri4.classCurrent.length; i++) {
            print("teacher:" + data.kb.fri4.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.fri4.classCurrent[i].location.toString());
            print("course:" + data.kb.fri4.classCurrent[i].course.toString());
            print("time:" + data.kb.fri4.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.fri4.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.fri4.classCurrent[i].start.toString());
            print("end:" + data.kb.fri4.classCurrent[i].end.toString());
          }
        }
        if (data.kb.fri5.kbFlag != 0) {
          for (int i = 0; i < data.kb.fri5.classCurrent.length; i++) {
            print("teacher:" + data.kb.fri5.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.fri5.classCurrent[i].location.toString());
            print("course:" + data.kb.fri5.classCurrent[i].course.toString());
            print("time:" + data.kb.fri5.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.fri5.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.fri5.classCurrent[i].start.toString());
            print("end:" + data.kb.fri5.classCurrent[i].end.toString());
          }
        }
        if (data.kb.sat1.kbFlag != 0) {
          for (int i = 0; i < data.kb.sat1.classCurrent.length; i++) {
            print("teacher:" + data.kb.sat1.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.sat1.classCurrent[i].location.toString());
            print("course:" + data.kb.sat1.classCurrent[i].course.toString());
            print("time:" + data.kb.sat1.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.sat1.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.sat1.classCurrent[i].start.toString());
            print("end:" + data.kb.sat1.classCurrent[i].end.toString());
          }
        }
        if (data.kb.sat2.kbFlag != 0) {
          for (int i = 0; i < data.kb.sat2.classCurrent.length; i++) {
            print("teacher:" + data.kb.sat2.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.sat2.classCurrent[i].location.toString());
            print("course:" + data.kb.sat2.classCurrent[i].course.toString());
            print("time:" + data.kb.sat2.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.sat2.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.sat2.classCurrent[i].start.toString());
            print("end:" + data.kb.sat2.classCurrent[i].end.toString());
          }
        }
        if (data.kb.sat3.kbFlag != 0) {
          for (int i = 0; i < data.kb.sat3.classCurrent.length; i++) {
            print("teacher:" + data.kb.sat3.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.sat3.classCurrent[i].location.toString());
            print("course:" + data.kb.sat3.classCurrent[i].course.toString());
            print("time:" + data.kb.sat3.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.sat3.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.sat3.classCurrent[i].start.toString());
            print("end:" + data.kb.sat3.classCurrent[i].end.toString());
          }
        }
        if (data.kb.sat4.kbFlag != 0) {
          for (int i = 0; i < data.kb.sat4.classCurrent.length; i++) {
            print("teacher:" + data.kb.sat4.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.sat4.classCurrent[i].location.toString());
            print("course:" + data.kb.sat4.classCurrent[i].course.toString());
            print("time:" + data.kb.sat4.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.sat4.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.sat4.classCurrent[i].start.toString());
            print("end:" + data.kb.sat4.classCurrent[i].end.toString());
          }
        }
        if (data.kb.sat5.kbFlag != 0) {
          for (int i = 0; i < data.kb.sat5.classCurrent.length; i++) {
            print("teacher:" + data.kb.sat5.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.sat5.classCurrent[i].location.toString());
            print("course:" + data.kb.sat5.classCurrent[i].course.toString());
            print("time:" + data.kb.sat5.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.sat5.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.sat5.classCurrent[i].start.toString());
            print("end:" + data.kb.sat5.classCurrent[i].end.toString());
          }
        }
        if (data.kb.sun1.kbFlag != 0) {
          for (int i = 0; i < data.kb.sun1.classCurrent.length; i++) {
            print("teacher:" + data.kb.sun1.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.sun1.classCurrent[i].location.toString());
            print("course:" + data.kb.sun1.classCurrent[i].course.toString());
            print("time:" + data.kb.sun1.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.sun1.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.sun1.classCurrent[i].start.toString());
            print("end:" + data.kb.sun1.classCurrent[i].end.toString());
          }
        }
        if (data.kb.sun2.kbFlag != 0) {
          for (int i = 0; i < data.kb.sun2.classCurrent.length; i++) {
            print("teacher:" + data.kb.sun2.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.sun2.classCurrent[i].location.toString());
            print("course:" + data.kb.sun2.classCurrent[i].course.toString());
            print("time:" + data.kb.sun2.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.sun2.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.sun2.classCurrent[i].start.toString());
            print("end:" + data.kb.sun2.classCurrent[i].end.toString());
          }
        }
        if (data.kb.sun3.kbFlag != 0) {
          for (int i = 0; i < data.kb.sun3.classCurrent.length; i++) {
            print("teacher:" + data.kb.sun3.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.sun3.classCurrent[i].location.toString());
            print("course:" + data.kb.sun3.classCurrent[i].course.toString());
            print("time:" + data.kb.sun3.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.sun3.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.sun3.classCurrent[i].start.toString());
            print("end:" + data.kb.sun3.classCurrent[i].end.toString());
          }
        }
        if (data.kb.sun4.kbFlag != 0) {
          for (int i = 0; i < data.kb.sun4.classCurrent.length; i++) {
            print("teacher:" + data.kb.sun4.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.sun4.classCurrent[i].location.toString());
            print("course:" + data.kb.sun4.classCurrent[i].course.toString());
            print("time:" + data.kb.sun4.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.sun4.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.sun4.classCurrent[i].start.toString());
            print("end:" + data.kb.sun4.classCurrent[i].end.toString());
          }
        }
        if (data.kb.sun5.kbFlag != 0) {
          for (int i = 0; i < data.kb.sun5.classCurrent.length; i++) {
            print("teacher:" + data.kb.sun5.classCurrent[i].teacher.toString());
            print(
                "location:" + data.kb.sun5.classCurrent[i].location.toString());
            print("course:" + data.kb.sun5.classCurrent[i].course.toString());
            print("time:" + data.kb.sun5.classCurrent[i].time.toString());
            print("js_xs:" + data.kb.sun5.classCurrent[i].jsXs.toString());
            print("start:" + data.kb.sun5.classCurrent[i].start.toString());
            print("end:" + data.kb.sun5.classCurrent[i].end.toString());
          }
        }
      } else {
        print("获取信息失败");
      }
    } else {
      print(response.statusCode);
    }
  }
}
>>>>>>> messagfe
