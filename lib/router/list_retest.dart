import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class List_ReTest extends StatefulWidget {
  List_ReTest({Key key}) : super(key: key);
  _listsstate createState() => _listsstate();
}

class _listsstate extends State<List_ReTest> {
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
  String cjzs = "";
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
                child: cjzs == ""
                    ? Center(child: CircularProgressIndicator())
                    :ListView.builder(
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
                        "补考查询",
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
                              hintText: "补考科目数:" + cjzs,
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
                      flex: 2,
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
                        listss[index]['ks_location'],
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
                      Icons.timer,
                      color: secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("考试时间:" + listss[index]['ks_time'],
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
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
                    Text("座位号:" + listss[index]['ks_seat'],
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

    FormData params = new FormData.from({
      'name': "bk",
      'account': prefs.getString("account"),
      'numb': prefs.getString("secret")
    });
    //print(params);
    Dio dio = new Dio();
    try {
      Response response = await dio
          .post("https://xxzx.bjtuhbxy.edu.cn/login/main/get_bk", data: params);
      if (response.statusCode == 200) {
        if (json.decode(response.data)["bk_flag"] == 1) {
          //   print(json.decode(response.data)["cj_all"]);
          //   List DATA1 = json.decode(response.data)["cj_all"];
          setState(() {
            listss = json.decode(response.data)["bk"];
            cjzs = json.decode(response.data)["exam_numb"].toString();
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
