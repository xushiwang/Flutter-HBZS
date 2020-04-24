import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hbzs/res/Browser.dart';
import 'package:toast/toast.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class WebVPN extends StatelessWidget {
  var webvpnURL = "https://vpn.bjtuhbxy.cn";
  var webvpnToken = "";
  var login = false;
  var cookieJar = CookieJar();
  var cookie;
  var webvpn_key;
  var url;
  BuildContext cont1;
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
                        url: "https://www.hbxy.xyz/jwxt/tiaoKuan.html",
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
                      Container(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Text(
                            "游客登录",
                            style: TextStyle(color: Colors.black45),
                          ))
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
                  print("login");
                  print(controlleruser.text);
                  print(controllerpwd.text);
                  if (controlleruser.text.length != 0 &&
                      controllerpwd.text.length != 0) {
                    Toast.show("正在登录中...", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    //print("执行登录代码");

                    Dio dio = new Dio();
                    try {
                      dio.interceptors.add(CookieManager(CookieJar()));
                      Response response = await dio
                          .post("https://vpn.bjtuhbxy.cn/api/signin", data: {
                        'username': controlleruser.text,
                        'password': controllerpwd.text,
                        'token': ''
                      });

                      if (response.statusCode == 200) {
                        if (json.decode(response.toString())["success"]) {
                          print("登录成功,执行vpn_key");
                          print("登录成功返回的原始Cookies  >>>>>>>>"+cookieJar.loadForRequest(Uri.parse(
                              "https://vpn.bjtuhbxy.cn/api/signin")).toString());
                          cookie = cookieJar
                              .loadForRequest(Uri.parse(
                                  "https://vpn.bjtuhbxy.cn/api/signin"))[0]
                              .toString()
                              .split(";")[0];
                              VPN();
                        }
                      } else {
                        print("HHERROR" + response.statusCode.toString());
                      }
                    } on DioError catch (e) {
                      // 请求错误处理
                      print("网络" + e.toString());
                      Toast.show("网络错误,请检查网络连接", context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                    }
                  } else {
                    Toast.show("用户名和密码均不能为空", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
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
    cont1 =context;
    return Scaffold(
      body: _buildPageContent(context),
    );
    
  }
  VPN() async {
    Dio dio1 = new Dio();
    dio1.interceptors.add(CookieManager(CookieJar()));
    try {
      Map<String, dynamic> headers = new Map();
      // headers['Cookie'] = cookieJar
      //     .loadForRequest(Uri.parse("https://vpn.bjtuhbxy.cn/api/signin"))[0]
      //     .toString()
      //     .split(";")[0];
      // print(cookie);
      // print(cookieJar.loadForRequest(
      //      Uri.parse("https://vpn.bjtuhbxy.cn/api/signin"))[0].toString().split(";")[0]);
      headers['Cookie'] = cookie;
      headers['Host'] = "vpn.bjtuhbxy.cn";
      Options options = new Options(headers: headers);
      print("获取通信KEY携带的cookie   >>>>>>>>>>" + cookie);
      Response response1 = await dio1
          .get("https://vpn.bjtuhbxy.cn/vpn_key/update", options: options);
      print("获取通信KEY返回的原始Cookie  >>>>>>>>>>>>>>>"+ cookieJar.loadForRequest(Uri.parse("https://vpn.bjtuhbxy.cn/vpn_key/update")).toString());

      webvpn_key = "_webvpn_key=" +
          cookieJar
              .loadForRequest(
                  Uri.parse("https://vpn.bjtuhbxy.cn/vpn_key/update"))
              .toString()
              .split("=")[5]
              .toString()
              .split(";")[0];
      //print("打印获取URL携带的用户cookie:  >>>>>>>>>" + webvpn_key);
      GetHttp();
    } on DioError catch (e) {
      print("XXOO" + e.toString());
    }
  }

  GetHttp() async {
    Dio dio2 = new Dio();
    try {
      Map<String, dynamic> headers = new Map();
      headers['Cookie'] =cookie;
      // print(cookie);
      // print(cookieJar.loadForRequest(
      //      Uri.parse("https://vpn.bjtuhbxy.cn/api/signin"))[0].toString().split(";")[0]);
      //headers['Cookie'] = cookie;
      print("打印获取URL携带的用户cookie:  >>>>>>>>>" + cookie.toString());
      Options options = new Options(headers: headers);

      Response response2 = await dio2.get(
          "https://vpn.bjtuhbxy.cn/quick?url=http://jw.bjtuhbxy.cn",
          options: options);
      print(response2.toString());
      url = json.decode(response2.toString())["url"];
      print("url"+url);
      Open();
    } on DioError catch (e) {
      print("XXOO" + e.toString());
    }
  }

  Open() async {
    Dio dio3 = new Dio();
    try {
      Map<String, dynamic> headers = new Map();
      headers['Cookie'] = webvpn_key;
      // print(cookie);
      // print(cookieJar.loadForRequest(
      //      Uri.parse("https://vpn.bjtuhbxy.cn/api/signin"))[0].toString().split(";")[0]);
      print("打印访问携带的webvpn_key:" + webvpn_key.toString());
      Options options = new Options(headers: headers);

      Response response3 = await dio3.get(url, options: options);
      print(response3.toString());
      print("**************************************************");
      Navigator.of(cont1)
                      .push(new MaterialPageRoute(builder: (_) {
                    return Browser(
                      url: url,
                      title: "校园动态",
                    );
                  }));
    } on DioError catch (e) {
      print("XXOO" + e.toString());
    }
  }

  
}
