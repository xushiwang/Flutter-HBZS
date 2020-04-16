import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class Lists extends StatefulWidget {
  Lists({Key key}) : super(key: key);
  static final String path = "lib/src/pages/lists/list2.dart";

  _listsstate createState() => _listsstate();
}

class _listsstate extends State<Lists> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);
  
  @override
  void initState() {
    super.initState();
    this.getcj();
  }

  List listss = [];
  String pjxfjd = "";
  String zyzrs = "";
  String xfjdzh = "";
  String account;
  String secret;

  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 145),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: pjxfjd == ""
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: listss.length,
                        itemBuilder: (BuildContext context, int index) {
                          return buildList(context, index);
                        }),
              ),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "我的成绩",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      IconButton(
                        onPressed: () {
                          print("ECHARTS绘图");
                          Navigator.pushNamed(context, '/echarts');
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 110,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          textAlign: TextAlign.center,
                          onEditingComplete: update(),
                          controller: _controller,
                          cursorColor: Theme.of(context).primaryColor,
                          style: dropdownMenuItem,
                          decoration: InputDecoration(
                              enabled: false,
                              hintText: "平均绩点:" + pjxfjd + "  专业人数:" + zyzrs,
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              prefixIcon: Material(
                                elevation: 0.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                // child: Icon(Icons.search),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 13)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      width: double.infinity,
      // height: 110,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text(
                        listss[index]['course_title'],
                        style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        listss[index]['course_result'],
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(listss[index]['college_name'],
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.local_offer,
                      color: secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(listss[index]['course_nature'],
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                  ],
                ),
                // SizedBox(
                //   height: 6,
                // ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.school,
                      color: secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                        "学年:" +
                            listss[index]['school_year'] +
                            "  学期:" +
                            listss[index]["semester"],
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                Row(children: <Widget>[
                  Icon(
                    Icons.insert_emoticon,
                    color: secondary,
                    size: 20,
                  ),
                  Text("代码:" + listss[index]['course_code'],
                      style: TextStyle(
                          color: primary, fontSize: 13, letterSpacing: .3)),
                ]),
                // SizedBox(
                //   height: 6,
                // ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.functions,
                      color: secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("学分:" + listss[index]['course_credit'],
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.favorite,
                      color: secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("绩点:" + listss[index]['grade_point'],
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> getcj() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      Map<String, String> map = {
        'name': "cj",
        'account':  prefs.getString("account"),
        'numb':  prefs.getString("account"),
      };
      FormData formData = FormData.fromMap(map);
      Dio dio = new Dio();
      Response response = await dio
          .post("https://xxzx.bjtuhbxy.edu.cn/login/main/ios/cj", data:formData);
      if (response.statusCode == 200) {
        if (json.decode(response.data)["cj_flag"] == 1) {
          //   print(json.decode(response.data)["cj_all"]);
          //   List DATA1 = json.decode(response.data)["cj_all"];
          setState(() {
            listss = json.decode(response.data)["cj_all"];
            pjxfjd = json.decode(response.data)["credit"]["pjxfjd"];
            zyzrs = json.decode(response.data)["credit"]["zyzrs"];
            xfjdzh = json.decode(response.data)["credit"]["xfjdzh"];
          });
        }
      } else {
        print(response.statusCode);
      }
    } on DioError catch (e) {
      // 请求错误处理
      print("网络" + e.toString());
      Toast.show("网络错误,请检查网络连接", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }

  update() {
    if (_controller.text != "") {
      print(_controller.text + "-");
      setState(() {
        SelectableText(_controller.text);
      });
    }
  }
}
