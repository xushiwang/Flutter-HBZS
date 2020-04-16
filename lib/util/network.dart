import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hbzs/model/kb_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class Network{
  final TextEditingController controlleruser = new TextEditingController();
  final TextEditingController controllerpwd = new TextEditingController();

  BuildContext get context => null;
  Future<void> net(String account0, String secret0, String key, l) async {
    final prefs = await SharedPreferences.getInstance();
    print("获取课表信息");
    Dio dio = new Dio();
    try {
      Map<String, String> map = {
        'name': "kb",
        'account': prefs.getString("account"),
        'numb': prefs.getString("secret")
      };
      FormData formData = FormData.fromMap(map);
      Response response = await dio
          .post("https://xxzx.bjtuhbxy.edu.cn/login/main/ios/kb", data: formData);
      if (response.statusCode == 200) {
        print(response.data.toString());
        Map data1 = json.decode(response.data);
        Map<String, dynamic> map = data1;
        KbData data = KbData.fromJson(map);
        print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
        //setKb(account0,data, key, l);
      }
    } on DioError {
      // 请求错误处理
      // Toast.show("网络错误,请检查网络连接", context,
      //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      print("error");
    }
  }

   getData() async {
    print("获取周次信息");
    Dio dio = new Dio();
    try {
      //Map<String,String> map = {'week':"week"};
      Response response =
          await dio.get("https://xxzx.bjtuhbxy.edu.cn/wxApplets/spaces/week",queryParameters: {'week':"week"});
          print(response.data);
          print(response.data["interval"]);
      if (response.statusCode == 200) {
        if (response.data["flag"] != 0) {
          return "第" + response.data["interval"].toString() + "周";
        } else {
          return "当前为非教学周";
        }
      }
    } on DioError catch (e) {
      print("获取周次信息失败");
      return "获取周次信息失败";
    }
  }
  login()  async {
    Dio dio = new Dio();
    try {
      Map<String, String> map = {
        'name': controlleruser.text.toString(),
        'pasd': controllerpwd.text.toString()
      };
      FormData formData = FormData.fromMap(map);
      print(formData);
      Response response = await dio.post(
        "https://xxzx.bjtuhbxy.edu.cn/login/main/ios",
        data: formData,
      );

      if (response.statusCode == 200) {
        if (json.decode(response.data)["login_flag"] == 1) {
          Toast.show("自动登录成功",context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        } else {
          Navigator.of(context).pushReplacementNamed('/login');
        }
      } else {
        Toast.show("网络错误,请检查网络连接", null,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
    } on DioError catch (e) {
      Toast.show("网络错误,请检查网络连接", null,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }
}