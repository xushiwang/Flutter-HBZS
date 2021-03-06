import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hbzs/common/global.dart';
import 'package:hbzs/res/Browser.dart';
import 'package:toast/toast.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final TextEditingController controlleruser = new TextEditingController();
  final TextEditingController controllerpwd = new TextEditingController();

  Widget _buildPageContent(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          //CircleAvatar(child: PNetworkImage(origami), maxRadius: 50, backgroundColor: Colors.transparent,),
          CircleAvatar(
            child: Image.asset("images/origami.png"),
            maxRadius: 50,
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            height: 20.0,
          ),
          _buildLoginForm(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    print("打开服务协议");
                    Navigator.of(context)
                        .push(new MaterialPageRoute(builder: (_) {
                      return new Browser(
                        url: Global.protrol_url,
                        title: "服务协议",
                      );
                    }));
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "登录即代表阅读并同意",
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: "服务协议",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                    style: TextStyle(fontSize: 12.0),
                  ))
            ],
          )
        ],
      ),
    );
  }

  Container _buildLoginForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: RoundedDiagonalPathClipper(),
            child: Container(
              height: 400,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 90.0,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.blue),
                        controller: controlleruser,
                        decoration: InputDecoration(
                            hintText: "请输入学工号",
                            hintStyle: TextStyle(color: Colors.blue.shade200),
                            border: InputBorder.none,
                            icon: Icon(Icons.person, color: Colors.blue)),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly, //只输入数字
                          LengthLimitingTextInputFormatter(8) //限制长度
                        ],
                      )),
                  Container(
                    child: Divider(
                      color: Colors.blue.shade400,
                    ),
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: controllerpwd,
                        style: TextStyle(color: Colors.blue),
                        decoration: InputDecoration(
                            hintText: "请输入密码",
                            hintStyle: TextStyle(color: Colors.blue.shade200),
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.lock,
                              color: Colors.blue,
                            )),
                        obscureText: true,
                      )),
                  Container(
                    child: Divider(
                      color: Colors.blue.shade400,
                    ),
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            Global.account = "fangke";
                            Navigator.of(context).pushReplacementNamed('/tabs');
                          },
                          child: Container(
                              padding: EdgeInsets.only(right: 20.0),
                              child: Text(
                                "游客登录",
                                style: TextStyle(color: Colors.black45),
                              )))
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.blue.shade600,
                //child: Icon(Icons.person),
                child: Image.asset("images/xh.gif"),
              ),
            ],
          ),
          Container(
            height: 420,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () async {
                  print("======================================> login");
                  print(controlleruser.text);
                  print(controllerpwd.text);
                  if (controlleruser.text.length != 0 &&
                      controllerpwd.text.length != 0) {
                    Toast.show("正在登录中...", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    print("========> 执行登录代码");

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
                          //登录成功
                          Global.nickname = json.decode(response.data)["name"];
                          Global.account =
                              json.decode(response.data)["account"];
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setString('account', Global.account);
                          prefs.setString(
                              'secret', json.decode(response.data)["secret"]);
                          prefs.setString('name', Global.nickname);
                          print(prefs.getString("name"));
                          Navigator.of(context).pushReplacementNamed('/tabs');
                        } else {
                          Toast.show(
                              json.decode(response.data)["error"], context,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM);
                        }
                      } else {
                        print(
                            "login.dart:216:" + response.statusCode.toString());
                      }
                    } on DioError catch (e) {
                      // 请求错误处理
                      print("网络" + e.toString());
                      Toast.show("网络错误,请检查网络连接", context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                    }
                  } else {
                    Toast.show("用户名和密码均不能为空", context,
                        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                child: Text("Login", style: TextStyle(color: Colors.white70)),
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(context),
    );
  }
}
