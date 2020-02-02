import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hbzs/model/kb_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassPage extends StatefulWidget {
  @override
  ClassPage({Key key}) : super(key: key);
  @override
  _ClassPageState createState() => _ClassPageState();
}

var _week = "";

class _ClassPageState extends State<ClassPage> {
  final TextEditingController controller = new TextEditingController();
  List<String> list = List.generate(35, (i) {
    return "";
  });
  @override
  void initState() {
    super.initState();
    this._getData();
    this.initList();
  }

  @override
  Widget build(BuildContext context) {
    void editkb(int index) {
      controller.text = list[index];
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
                      autofocus: true,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          filled: true, fillColor: Colors.grey.shade50),
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
                      list[index] = controller.text;
                    });
                    savaList(list);
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
          backgroundColor: Colors.white,
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
                          title: Text("温馨提示",style: TextStyle(color:Color.fromARGB(255, 207, 169, 114)),),
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
                                  color:Color.fromARGB(255, 207, 169, 114),
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
                    this.net();
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
                          editkb(index);
                        },
                        colorBrightness: Brightness.light,
                        child: Text(
                          list[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ));
                  } else {
                    return RaisedButton(
                        elevation: 5.0,
                        padding: EdgeInsets.all(0),
                        color: Colors.white,
                        onLongPress: () {
                          print(index.toString());
                          editkb(index);
                        },
                        colorBrightness: Brightness.light,
                        child: Text(
                          list[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10, color: Colors.grey),
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
                  return RaisedButton(
                      color: Colors.white,
                      padding: EdgeInsets.all(0),
                      onLongPress: () {
                        print(index.toString());
                        editkb(index);
                      },
                      colorBrightness: Brightness.light,
                      //splashColor: Color.fromARGB(255, 207, 169, 114),
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        list[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ));
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

  Future<bool> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示",style:TextStyle(color: Color.fromARGB(255, 207, 169, 114))),
          content: Text("刷新课表将丢失自定义的课表?"),
          actions: <Widget>[
            OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                "取消",
                style: TextStyle(color: Color.fromARGB(255, 207, 169, 114),),
              ),
              color: Color.fromARGB(255, 207, 169, 114),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              color: Colors.white,
              child: Text(
                "刷新",
                style: TextStyle(color:Color.fromARGB(255, 207, 169, 114)),
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

  Future<void> setKb(KbData data) async {
    final prefs = await SharedPreferences.getInstance();
    if (data.kbFlag == 1) {
      print(data.information.xy);
      print(data.information.zy);
      print(data.information.bj);
      print(data.information.xm);
      print(data.information.xh);
      print(data.information.xn);
      print(data.information.xq);
      if (data.kb.mon1.kbFlag != 0) {
        for (int i = 0; i < data.kb.mon1.classCurrent.length; i++) {
          setState(() {
            list[0] = list[0] +
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
            list[5] = list[5] +
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
            list[10] = list[10] +
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
            list[15] = list[15] +
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
            list[20] = list[20] +
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
            list[1] = list[1] +
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
            list[6] = list[6] +
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
            list[11] = list[11] +
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
            list[16] = list[16] +
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
            list[21] = list[21] +
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
            list[2] = list[2] +
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
            list[7] = list[7] +
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
            list[12] = list[12] +
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
            list[17] = list[17] +
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
            list[22] = list[22] +
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
            list[3] = list[3] +
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
            list[8] = list[8] +
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
            list[13] = list[13] +
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
            list[18] = list[18] +
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
            list[23] = list[23] +
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
            list[4] = list[4] +
                data.kb.fri1.classCurrent[i].course +
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
            list[9] = list[9] +
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
            list[14] = list[14] +
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
            list[19] = list[19] +
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
            list[24] = list[24] +
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
            list[25] = list[25] +
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
            list[26] = list[26] +
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
            list[27] = list[27] +
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
            list[28] = list[28] +
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
            list[29] = list[29] +
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
            list[30] = list[30] +
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
            list[31] = list[31] +
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
            list[32] = list[32] +
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
            list[33] = list[33] +
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
            list[34] = list[34] +
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
      prefs.setStringList("kb", list);
      print("object");
    } else {
      print("获取信息失败");
    }
  }

  Future<void> net() async {
    list = List.generate(35, (i) {
      return "";
    });
    print("获取课表信息");
    final prefs = await SharedPreferences.getInstance();
    FormData params = new FormData.from({
      'name': "kb",
      'account': prefs.getString("account"),
      'numb': prefs.getString("secret")
    });
    Dio dio = new Dio();
    Response response = await dio
        .post("https://xxzx.bjtuhbxy.edu.cn/login/main/get_kb", data: params);
    if (response.statusCode == 200) {
      Map data1 = json.decode(response.data);
      Map<String, dynamic> map = data1;
      KbData data = KbData.fromJson(map);
      setKb(data);
    } else {
      print(response.statusCode);
    }
  }

  Future<void> initList() async {
    final prefs = await SharedPreferences.getInstance();

    var a = prefs.getStringList("kb");
    if (a != null) {
      setState(() {
        list = a;
      });
    } else {
      print("打印缓存" + list.toString());
      print("打印结束");
      print(list.toString() + "%%%%%%%%%%%%%%%%%%%%%%%%%%%init后的数据");
      this.net();
    }
  }

  Future<void> savaList(list) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList("kb", list);
  }
}
