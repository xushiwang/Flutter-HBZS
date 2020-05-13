import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hbzs/common/global.dart';
import 'package:hbzs/res/assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadPage extends StatefulWidget {
  LoadPage({Key key}) : super(key: key);

  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  var flag;
  String avator_img;
  
  @override
  void initState() {
    super.initState();
    //查看本地是否存在数据
    init();
    //获取周次信息
    getweek();
    //等待信息3秒后执行操作
    Future.delayed(Duration(seconds: 3), () {
      //获取个人信息 班级专业 学院等
      net();
      (Global.account != null && Global.account != "")
          ? Navigator.of(context).pushReplacementNamed('/tabs')
          : Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  init() async {
    //获取姓名 学号 头像地址
    final prefs = await SharedPreferences.getInstance();
    flag = prefs.getString("account");
    avator_img = prefs.getString("avator_img");
    Global.nickname = prefs.get("name");
    Global.account = flag;
    //默认头像
    avator_img != null
        ? Global.avator_img_url = avator_img
        : Global.avator_img_url = "";
    print("缓存用户学号：" + Global.account);
  }

  Future<void> net() async {
    final prefs = await SharedPreferences.getInstance();
    String a = prefs.getString('banji');
    if (a == null) {
      //print("获取课表信息");
      Dio dio = new Dio();
      if (Global.account != "fangke") {
        try {
          Map<String, String> map = {
            'name': "kb",
            'account': Global.account,
            'numb': Global.account,
          };
          FormData formData = FormData.fromMap(map);
          Response response = await dio.post(Global.kb_url, data: formData);
          if (response.statusCode == 200) {
            //将信息持久化到本地并放入Global
            Global.zhuanye = json.decode(response.data)["information"]["zy"];
            Global.banji = json.decode(response.data)["information"]["bj"];
            Global.xueyuan = json.decode(response.data)["information"]["xy"];
            prefs.setString('zhuanye', Global.zhuanye);
            prefs.setString('banji', Global.banji);
            prefs.setString('xueyuan', Global.xueyuan);
          }
        } on DioError {
          // 请求错误处理
        }
      }
    } else {
      Global.zhuanye = prefs.getString("zhuanye");
      Global.banji = prefs.getString("banji");
      Global.xueyuan = prefs.getString("xueyuan");
    }
  }

  getweek() async {
    print("获取周次信息");
    Dio dio = new Dio();
    String week;
    try {
      Response response =
          await dio.get(Global.get_week, queryParameters: {'week': "week"});
      print(response.data);
      print(response.data["interval"]);
      if (response.statusCode == 200) {
        if (response.data["flag"] != 0) {
          week = "第" + response.data["interval"].toString() + "周";
        } else {
          week = "当前为非教学周";
        }
        Global.week = week;
      }
    } on DioError catch (e) {
      print("获取周次信息失败" + e.toString());
      week = "获取周次信息失败";
      Global.week = week;
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
