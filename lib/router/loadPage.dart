import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hbzs/common/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadPage extends StatefulWidget {
  LoadPage({Key key}) : super(key: key);

  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  var flag;
  @override
  void initState() {
    init();
    getweek();
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      (flag != null && flag != "")
          ? Navigator.of(context).pushReplacementNamed('/tabs')
          : Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  init() async {
    final prefs = await SharedPreferences.getInstance();
    flag = prefs.getString("account");
    Global.account=flag;
  }

  getweek() async {
    print("获取周次信息");
    Dio dio = new Dio();
    String week;
    try {
      Response response = await dio.get(
          "https://xxzx.bjtuhbxy.edu.cn/wxApplets/spaces/week",
          queryParameters: {'week': "week"});
      print(response.data);
      print(response.data["interval"]);
      if (response.statusCode == 200) {
        if (response.data["flag"] != 0) {
          week = "第" + response.data["interval"].toString() + "周";
        } else {
          week = "当前为非教学周";
        }
        Global.week=week;
      }
    } on DioError catch (e) {
      print("获取周次信息失败" + e.toString());
      week = "获取周次信息失败";
      Global.week=week;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(children: <Widget>[
      Image.asset(
        'images/loading.jpg',
        fit: BoxFit.cover,
      )
    ]));
  }
}
