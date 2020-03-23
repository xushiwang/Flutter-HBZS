import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hbzs/model/kb_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class ClassPage extends StatefulWidget {
  @override
  ClassPage({Key key}) : super(key: key);
  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  final TextEditingController controller = new TextEditingController();
  var _week = "";
  static List<String> list = List.generate(35, (i) {
    return "";
  });
  static List<String> listql = List.generate(35, (i) {
    return "";
  });
  String account1 = "16851051";
  String secret1 = "16851051";
  String account = "16851144";
  String secret = "16851144";
  @override
  void initState() {
    super.initState();
    this._getData();
    this.init();
    this.initList1();
  }

  @override
  Widget build(BuildContext context) {
    void editkb(int index, String key, List<String> listtemp) {
      controller.text = listtemp[index];
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('键入以编辑课表'),
              content: Card(
                elevation: 5.0,
                child: Column(
                  children: <Widget>[
                    TextField(
                      maxLines: null,
                      autofocus: false,//自动编辑
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          filled: true, fillColor: Colors.white),
                      controller: controller,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('取消'),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      listtemp[index] = controller.text;
                    });
                    savaList(key, listtemp);
                  },
                  child: Text('确定'),
                ),
              ],
            );
          });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          // backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Builder(builder: (context) {
              return IconButton(
                icon: Icon(Icons.help_outline, color: Colors.black), //自定义图标
                onPressed: () {
                  // 使用帮助
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "温馨提示",
                            style: TextStyle(
                                color: Color.fromARGB(255, 207, 169, 114)),
                          ),
                          content: Text("长按课表可以编辑"),
                          actions: <Widget>[
                            OutlineButton(
                              color: Color.fromARGB(255, 207, 169, 114),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              //splashColor: Color.fromARGB(255, 207, 169, 114),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: new Text(
                                "好的",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 207, 169, 114),
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                },
              );
            }),
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              _week.toString(),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                color: Colors.black,
                onPressed: () async {
                  print('刷新课表');
                  bool delete = await showDeleteConfirmDialog1();
                  if (delete == null) {
                    print("取消删除");
                  } else {
                    net(account, secret, "kb", list);
                    print("刷新");
                    net(account1, secret1, "qlkb", listql);
                    print("刷新1");
                    print("已确认删除");
                    //... 删除文件

                  }
                },
              )
            ],
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
            Scaffold(
              appBar: AppBar(
                  backgroundColor: Color.fromARGB(255, 207, 169, 114),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "周一",
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "周二",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "周三",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "周四",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "周五",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  )),
              body: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, childAspectRatio: 0.6),
                itemCount: 25,
                itemBuilder: (context, index) {
                  if ((index > 4 && index < 10) || (index > 14 && index < 20)) {
                    return RaisedButton(
                        elevation: 5.0,
                        padding: EdgeInsets.all(3),
                        color: Color.fromARGB(255, 207, 169, 114),
                        onLongPress: () {
                          print(index.toString());
                          editkb(index, "kb", list);
                        },
                        colorBrightness: Brightness.light,
                        child: Text(
                          list[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ));
                  } else {
                    return RaisedButton(
                        elevation: 5.0,
                        padding: EdgeInsets.all(0),
                        color: Colors.white,
                        onLongPress: () {
                          print(index.toString());
                          editkb(index, "kb", list);
                        },
                        colorBrightness: Brightness.light,
                        child: Text(
                          list[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ));
                  }
                },
              ),
            ),
            //second
            Scaffold(
              appBar: AppBar(
                  backgroundColor: Color.fromARGB(255, 207, 169, 114),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "周一",
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "周二",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "周三",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "周四",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "周五",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  )),
              body: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, childAspectRatio: 0.6),
                itemCount: 25,
                itemBuilder: (context, index) {
                  if ((index > 4 && index < 10) || (index > 14 && index < 20)) {
                    return RaisedButton(
                        elevation: 5.0,
                        padding: EdgeInsets.all(3),
                        color: Color.fromARGB(255, 207, 169, 114),
                        onLongPress: () {
                          print(index.toString());
                          editkb(index, "qlkb", listql);
                        },
                        colorBrightness: Brightness.light,
                        child: Text(
                          listql[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ));
                  } else {
                    return RaisedButton(
                        elevation: 5.0,
                        padding: EdgeInsets.all(0),
                        color: Colors.white,
                        onLongPress: () {
                          print(index.toString());
                          editkb(index, "qlkb", listql);
                        },
                        colorBrightness: Brightness.light,
                        child: Text(
                          listql[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ));
                  }
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }

  _getData() async {
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
          setState(() {
            _week =
                "第" + response.data["interval"].toString() + "周";
          });
        } else {
          setState(() {
            _week = "当前为非教学周";
          });
        }
      }
    } on DioError catch (e) {
      print("获取周次信息失败");
      setState(() {
        _week = "获取周次信息失败";
      });
    }
  }

  Future<bool> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示",
              style: TextStyle(color: Color.fromARGB(255, 207, 169, 114))),
          content: Text("刷新课表将丢失自定义的课表?"),
          actions: <Widget>[
            OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                "取消",
                style: TextStyle(
                  color: Color.fromARGB(255, 207, 169, 114),
                ),
              ),
              color: Color.fromARGB(255, 207, 169, 114),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Colors.white,
              child: Text(
                "刷新",
                style: TextStyle(color: Color.fromARGB(255, 207, 169, 114)),
              ),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> setKb(String me,KbData data, String key, List<String> l) async {
    final prefs = await SharedPreferences.getInstance();
    if (data.kbFlag == 1) {
      print(data.information.xy);
      print(data.information.zy);
      print(data.information.bj);
      print(data.information.xm);
      print(data.information.xh);
      print(data.information.xn);
      print(data.information.xq);

      l = List.generate(35, (i) {
        return "";
      });
      if (data.kb.mon1.kbFlag != 0) {
        for (int i = 0; i < data.kb.mon1.classCurrent.length; i++) {
          setState(() {
            l[0] = l[0] +
                data.kb.mon1.classCurrent[i].course +
                "\n" +
                data.kb.mon1.classCurrent[i].teacher +
                "\n" +
                data.kb.mon1.classCurrent[i].time.toString() +
                "\n" +
                data.kb.mon1.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.mon2.kbFlag != 0) {
        for (int i = 0; i < data.kb.mon2.classCurrent.length; i++) {
          setState(() {
            l[5] = l[5] +
                data.kb.mon2.classCurrent[i].course +
                "\n" +
                data.kb.mon2.classCurrent[i].teacher +
                "\n" +
                data.kb.mon2.classCurrent[i].time.toString() +
                "\n" +
                data.kb.mon2.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.mon3.kbFlag != 0) {
        for (int i = 0; i < data.kb.mon3.classCurrent.length; i++) {
          setState(() {
            l[10] = l[10] +
                data.kb.mon3.classCurrent[i].course +
                "\n" +
                data.kb.mon3.classCurrent[i].teacher +
                "\n" +
                data.kb.mon3.classCurrent[i].time.toString() +
                "\n" +
                data.kb.mon3.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.mon4.kbFlag != 0) {
        for (int i = 0; i < data.kb.mon4.classCurrent.length; i++) {
          setState(() {
            l[15] = l[15] +
                data.kb.mon4.classCurrent[i].course +
                "\n" +
                data.kb.mon4.classCurrent[i].teacher +
                "\n" +
                data.kb.mon4.classCurrent[i].time.toString() +
                "\n" +
                data.kb.mon4.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.mon5.kbFlag != 0) {
        for (int i = 0; i < data.kb.mon1.classCurrent.length; i++) {
          setState(() {
            l[20] = l[20] +
                "\n" +
                data.kb.mon5.classCurrent[i].course +
                "\n" +
                data.kb.mon5.classCurrent[i].teacher +
                "\n" +
                data.kb.mon5.classCurrent[i].time.toString() +
                "\n" +
                data.kb.mon5.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.tues1.kbFlag != 0) {
        for (int i = 0; i < data.kb.tues1.classCurrent.length; i++) {
          setState(() {
            l[1] = l[1] +
                data.kb.tues1.classCurrent[i].course +
                "\n" +
                data.kb.tues1.classCurrent[i].teacher +
                "\n" +
                data.kb.tues1.classCurrent[i].time.toString() +
                "\n" +
                data.kb.tues1.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.tues2.kbFlag != 0) {
        for (int i = 0; i < data.kb.tues2.classCurrent.length; i++) {
          setState(() {
            l[6] = l[6] +
                data.kb.tues2.classCurrent[i].course +
                "\n" +
                data.kb.tues2.classCurrent[i].teacher +
                "\n" +
                data.kb.tues2.classCurrent[i].time.toString() +
                "\n" +
                data.kb.tues2.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.tues3.kbFlag != 0) {
        for (int i = 0; i < data.kb.tues3.classCurrent.length; i++) {
          setState(() {
            l[11] = l[11] +
                data.kb.tues3.classCurrent[i].course +
                "\n" +
                data.kb.tues3.classCurrent[i].teacher +
                "\n" +
                data.kb.tues3.classCurrent[i].time.toString() +
                "\n" +
                data.kb.tues3.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.tues4.kbFlag != 0) {
        for (int i = 0; i < data.kb.tues4.classCurrent.length; i++) {
          setState(() {
            l[16] = l[16] +
                data.kb.tues4.classCurrent[i].course +
                "\n" +
                data.kb.tues4.classCurrent[i].teacher +
                "\n" +
                data.kb.tues4.classCurrent[i].time.toString() +
                "\n" +
                data.kb.tues4.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.tues5.kbFlag != 0) {
        for (int i = 0; i < data.kb.tues5.classCurrent.length; i++) {
          setState(() {
            l[21] = l[21] +
                "\n" +
                data.kb.tues5.classCurrent[i].course +
                "\n" +
                data.kb.tues5.classCurrent[i].teacher +
                "\n" +
                data.kb.tues5.classCurrent[i].time.toString() +
                "\n" +
                data.kb.tues5.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.wed1.kbFlag != 0) {
        for (int i = 0; i < data.kb.wed1.classCurrent.length; i++) {
          setState(() {
            l[2] = l[2] +
                data.kb.wed1.classCurrent[i].course +
                "\n" +
                data.kb.wed1.classCurrent[i].teacher +
                "\n" +
                data.kb.wed1.classCurrent[i].time.toString() +
                "\n" +
                data.kb.wed1.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.wed2.kbFlag != 0) {
        for (int i = 0; i < data.kb.wed2.classCurrent.length; i++) {
          setState(() {
            l[7] = l[7] +
                data.kb.wed2.classCurrent[i].course +
                "\n" +
                data.kb.wed2.classCurrent[i].teacher +
                "\n" +
                data.kb.wed2.classCurrent[i].time.toString() +
                "\n" +
                data.kb.wed2.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.wed3.kbFlag != 0) {
        for (int i = 0; i < data.kb.wed3.classCurrent.length; i++) {
          setState(() {
            l[12] = l[12] +
                data.kb.wed3.classCurrent[i].course +
                "\n" +
                data.kb.wed3.classCurrent[i].teacher +
                "\n" +
                data.kb.wed3.classCurrent[i].time.toString() +
                "\n" +
                data.kb.wed3.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.wed4.kbFlag != 0) {
        for (int i = 0; i < data.kb.wed4.classCurrent.length; i++) {
          setState(() {
            l[17] = l[17] +
                data.kb.wed4.classCurrent[i].course +
                "\n" +
                data.kb.wed4.classCurrent[i].teacher +
                "\n" +
                data.kb.wed4.classCurrent[i].time.toString() +
                "\n" +
                data.kb.wed4.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.wed5.kbFlag != 0) {
        for (int i = 0; i < data.kb.wed5.classCurrent.length; i++) {
          setState(() {
            l[22] = l[22] +
                data.kb.wed5.classCurrent[i].course +
                "\n" +
                data.kb.wed5.classCurrent[i].teacher +
                "\n" +
                data.kb.wed5.classCurrent[i].time.toString() +
                "\n" +
                data.kb.wed5.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.thur1.kbFlag != 0) {
        for (int i = 0; i < data.kb.thur1.classCurrent.length; i++) {
          setState(() {
            l[3] = l[3] +
                data.kb.thur1.classCurrent[i].course +
                "\n" +
                data.kb.thur1.classCurrent[i].teacher +
                "\n" +
                data.kb.thur1.classCurrent[i].time.toString() +
                "\n" +
                data.kb.thur1.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.thur2.kbFlag != 0) {
        for (int i = 0; i < data.kb.thur2.classCurrent.length; i++) {
          setState(() {
            l[8] = l[8] +
                data.kb.thur2.classCurrent[i].course +
                "\n" +
                data.kb.thur2.classCurrent[i].teacher +
                "\n" +
                data.kb.thur2.classCurrent[i].time.toString() +
                "\n" +
                data.kb.thur2.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.thur3.kbFlag != 0) {
        for (int i = 0; i < data.kb.thur3.classCurrent.length; i++) {
          setState(() {
            l[13] = l[13] +
                data.kb.thur3.classCurrent[i].course +
                "\n" +
                data.kb.thur3.classCurrent[i].teacher +
                "\n" +
                data.kb.thur3.classCurrent[i].time.toString() +
                "\n" +
                data.kb.thur3.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.thur4.kbFlag != 0) {
        for (int i = 0; i < data.kb.thur4.classCurrent.length; i++) {
          setState(() {
            l[18] = l[18] +
                data.kb.thur4.classCurrent[i].course +
                "\n" +
                data.kb.thur4.classCurrent[i].teacher +
                "\n" +
                data.kb.thur4.classCurrent[i].time.toString() +
                "\n" +
                data.kb.thur4.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.thur5.kbFlag != 0) {
        for (int i = 0; i < data.kb.thur5.classCurrent.length; i++) {
          setState(() {
            l[23] = l[23] +
                data.kb.thur5.classCurrent[i].course +
                "\n" +
                data.kb.thur5.classCurrent[i].teacher +
                "\n" +
                data.kb.thur5.classCurrent[i].time.toString() +
                "\n" +
                data.kb.thur5.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.fri1.kbFlag != 0) {
        for (int i = 0; i < data.kb.fri1.classCurrent.length; i++) {
          setState(() {
            l[4] = l[4] +
                data.kb.fri1.classCurrent[i].course.toString() +
                "\n" +
                data.kb.fri1.classCurrent[i].teacher +
                "\n" +
                data.kb.fri1.classCurrent[i].time.toString() +
                "\n" +
                data.kb.fri1.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.fri2.kbFlag != 0) {
        for (int i = 0; i < data.kb.fri2.classCurrent.length; i++) {
          setState(() {
            l[9] = l[9] +
                data.kb.fri2.classCurrent[i].course +
                "\n" +
                data.kb.fri2.classCurrent[i].teacher +
                "\n" +
                data.kb.fri2.classCurrent[i].time.toString() +
                "\n" +
                data.kb.fri2.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.fri3.kbFlag != 0) {
        for (int i = 0; i < data.kb.fri3.classCurrent.length; i++) {
          setState(() {
            l[14] = l[14] +
                data.kb.fri3.classCurrent[i].course +
                "\n" +
                data.kb.fri3.classCurrent[i].teacher +
                "\n" +
                data.kb.fri3.classCurrent[i].time.toString() +
                "\n" +
                data.kb.fri3.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.fri4.kbFlag != 0) {
        for (int i = 0; i < data.kb.fri4.classCurrent.length; i++) {
          setState(() {
            l[19] = l[19] +
                data.kb.fri4.classCurrent[i].course +
                "\n" +
                data.kb.fri4.classCurrent[i].teacher +
                "\n" +
                data.kb.fri4.classCurrent[i].time.toString() +
                "\n" +
                data.kb.fri4.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.fri5.kbFlag != 0) {
        for (int i = 0; i < data.kb.fri5.classCurrent.length; i++) {
          setState(() {
            l[24] = l[24] +
                data.kb.fri5.classCurrent[i].course +
                "\n" +
                data.kb.fri5.classCurrent[i].teacher +
                "\n" +
                data.kb.fri5.classCurrent[i].time.toString() +
                "\n" +
                data.kb.fri5.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.sat1.kbFlag != 0) {
        for (int i = 0; i < data.kb.sat1.classCurrent.length; i++) {
          setState(() {
            l[25] = l[25] +
                data.kb.sat1.classCurrent[i].course +
                "\n" +
                data.kb.sat1.classCurrent[i].teacher +
                "\n" +
                data.kb.sat1.classCurrent[i].time.toString() +
                "\n" +
                data.kb.sat1.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.sat2.kbFlag != 0) {
        for (int i = 0; i < data.kb.sat2.classCurrent.length; i++) {
          setState(() {
            l[26] = l[26] +
                data.kb.sat2.classCurrent[i].course +
                "\n" +
                data.kb.sat2.classCurrent[i].teacher +
                "\n" +
                data.kb.sat2.classCurrent[i].time.toString() +
                "\n" +
                data.kb.sat2.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.sat3.kbFlag != 0) {
        for (int i = 0; i < data.kb.sat3.classCurrent.length; i++) {
          setState(() {
            l[27] = l[27] +
                data.kb.sat3.classCurrent[i].course +
                "\n" +
                data.kb.sat3.classCurrent[i].teacher +
                "\n" +
                data.kb.sat3.classCurrent[i].time.toString() +
                "\n" +
                data.kb.sat3.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.sat4.kbFlag != 0) {
        for (int i = 0; i < data.kb.sat4.classCurrent.length; i++) {
          setState(() {
            l[28] = l[28] +
                data.kb.sat4.classCurrent[i].course +
                "\n" +
                data.kb.sat4.classCurrent[i].teacher +
                "\n" +
                data.kb.sat4.classCurrent[i].time.toString() +
                "\n" +
                data.kb.sat4.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.sat5.kbFlag != 0) {
        for (int i = 0; i < data.kb.sat5.classCurrent.length; i++) {
          setState(() {
            l[29] = l[29] +
                data.kb.sat5.classCurrent[i].course +
                "\n" +
                data.kb.sat5.classCurrent[i].teacher +
                "\n" +
                data.kb.sat5.classCurrent[i].time.toString() +
                "\n" +
                data.kb.sat5.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.sun1.kbFlag != 0) {
        for (int i = 0; i < data.kb.sun1.classCurrent.length; i++) {
          setState(() {
            l[30] = l[30] +
                data.kb.sun1.classCurrent[i].course +
                "\n" +
                data.kb.sun1.classCurrent[i].teacher +
                "\n" +
                data.kb.sun1.classCurrent[i].time.toString() +
                "\n" +
                data.kb.sun1.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.sun2.kbFlag != 0) {
        for (int i = 0; i < data.kb.sun2.classCurrent.length; i++) {
          setState(() {
            l[31] = l[31] +
                data.kb.sun2.classCurrent[i].course +
                "\n" +
                data.kb.sun2.classCurrent[i].teacher +
                "\n" +
                data.kb.sun2.classCurrent[i].time.toString() +
                "\n" +
                data.kb.sun2.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.sun3.kbFlag != 0) {
        for (int i = 0; i < data.kb.sun3.classCurrent.length; i++) {
          setState(() {
            l[32] = l[32] +
                data.kb.sun3.classCurrent[i].course +
                "\n" +
                data.kb.sun3.classCurrent[i].teacher +
                "\n" +
                data.kb.sun3.classCurrent[i].time.toString() +
                "\n" +
                data.kb.sun3.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.sun4.kbFlag != 0) {
        for (int i = 0; i < data.kb.sun4.classCurrent.length; i++) {
          setState(() {
            l[33] = l[33] +
                data.kb.sun4.classCurrent[i].course +
                "\n" +
                data.kb.sun4.classCurrent[i].teacher +
                "\n" +
                data.kb.sun4.classCurrent[i].time.toString() +
                "\n" +
                data.kb.sun4.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      if (data.kb.sun5.kbFlag != 0) {
        for (int i = 0; i < data.kb.sun5.classCurrent.length; i++) {
          setState(() {
            l[34] = l[34] +
                data.kb.sun5.classCurrent[i].course +
                "\n" +
                data.kb.sun5.classCurrent[i].teacher +
                "\n" +
                data.kb.sun5.classCurrent[i].time.toString() +
                "\n" +
                data.kb.sun5.classCurrent[i].location.toString() +
                "\n";
          });
        }
      }
      prefs.setStringList(key, l);
      if (this.account == me) {
        setState(() {
          list = l;
        });
      } else {
        setState(() {
          listql = l;
        });
      }
    } else {
      print("获取信息失败");
    }
  }

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
        setKb(account0,data, key, l);
      }
    } on DioError {
      // 请求错误处理
      Toast.show("网络错误,请检查网络连接", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    // account = prefs.getString("account");
    // secret = prefs.getString("secret");

    var a = prefs.getStringList("kb");
    if (a != null) {
      setState(() {
        list = a;
      });
    } else {
      print("打印缓存" + list.toString());
      print("打印结束");
      print(list.toString() + "%%%%%%%%%%%%%%%%%%%%%%%%%%%init后的数据");
      net(account, secret, "kb", list);
    }
  }

  Future<void> initList1() async {
    // 情侣课表
    final prefs = await SharedPreferences.getInstance();
    // account1 = prefs.getString("account");//情侣key
    // secret1 = prefs.getString("secret");//情侣key
    var b = prefs.getStringList("qlkb");
    if (b != null) {
      setState(() {
        listql = b;
      });
    } else {
      print("打印缓存1" + listql.toString());
      print("打印结束1");
      print(listql.toString() + "%%%%%%%%%%%%%%%%%%%%%%%%%%%init1后的数据");
      net(account1, secret1, "qlkb", listql);
    }
  }

  Future<void> savaList(String key, List list2) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, list2);
  }
}
