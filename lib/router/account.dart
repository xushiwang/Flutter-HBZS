import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hbzs/common/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class Account extends StatefulWidget {
  Account({Key key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

final TextEditingController controlleruser = new TextEditingController();
final TextEditingController controllerpwd = new TextEditingController();

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("账号与安全", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: ListView(children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 20),
              Expanded(child: Text("开启指纹登陆")),
              Switch(
                  value: Global.finger,
                  onChanged: (bool value) {
                    setState(() {
                      Global.finger = value;
                      if (value) {
                        Toast.show("指纹登录已开启", context);
                      } else {
                        Toast.show("指纹登陆已关闭", context);
                      }
                    });
                  })
            ],
          ),
          Divider(),
          Row(
            children: <Widget>[
              SizedBox(width: 20,height: 40,),
              Text("Ta的账号"),
            ]
          ),
          Divider(),
          Row(
            children: <Widget>[
              SizedBox(width: 20,height: 40,),
              Expanded(child: Text("Ta的密码")),
            ],
          ),
        ]));
  }

  Future<void> save(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("finger", value);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    save(Global.finger);
  }
}
