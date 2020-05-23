import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hbzs/common/global.dart';
import 'package:hbzs/res/assets.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class LoadPage extends StatefulWidget {
  LoadPage({Key key}) : super(key: key);

  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  var flag;
  String avator_img;
  var localAuth = LocalAuthentication();
    
  
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
      if(Global.finger != null?Global.finger:false){//开启了指纹
         auth(localAuth);
      }else{
        (Global.account != null && Global.account != "")
          ? Navigator.of(context).pushReplacementNamed('/tabs')
          : Navigator.of(context).pushReplacementNamed('/login');
    }});
  }

  init() async {
    //获取姓名 学号 头像地址
    final prefs = await SharedPreferences.getInstance();
    Global.account = prefs.getString("account");
    Global.account_2 = prefs.getString("account_2");
    Global.secret_2 = prefs.getString("secret_2");
    avator_img = prefs.getString("avator_img");
    Global.finger = prefs.getBool("finger");
    Global.nickname = prefs.get("name");
    print(Global.finger);
    //默认头像
    avator_img != null
        ? Global.avator_img_url = avator_img
        : Global.avator_img_url = "";
    print("缓存用户学号："+ Global.account);
  }
  auth(localAuth) async {
    //下面是汉化
    const andStrings = const AndroidAuthMessages(
      cancelButton: '密码登录',
      goToSettingsButton: '去设置',
      fingerprintNotRecognized: '指纹识别失败',
      goToSettingsDescription: '请设置指纹.',
      fingerprintHint: '指纹',
      fingerprintSuccess: '指纹识别成功',
      signInTitle: '指纹验证',
      fingerprintRequiredTitle: '请先录入指纹!',
    );
    try {
      bool didAuthenticate = await localAuth.authenticateWithBiometrics(
          localizedReason: '扫描指纹进行身份识别',
          useErrorDialogs: false,
          stickyAuth: true,
          androidAuthStrings: andStrings);
      if (didAuthenticate == true) {
        Toast.show("认证成功", context);
         (Global.account != null && Global.account != "")
          ? Navigator.of(context).pushReplacementNamed('/tabs')
          : Navigator.of(context).pushReplacementNamed('/login');
      
      } else {
        Toast.show("认证失败", context);
        Navigator.of(context).pushReplacementNamed('/login');
      }
    } catch (e) {
      Toast.show("不能支持验证", context);
    }
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
