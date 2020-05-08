
import 'package:flutter/material.dart';
import 'package:hbzs/common/global.dart';
import 'package:hbzs/res/Browser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class MyTitleList extends StatelessWidget {
  const MyTitleList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      ListTile(
        leading: Icon(Icons.person,color:Colors.black),
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          '个人中心',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/editinfo');
        },
      ),

      //分割线
      Container(
        child: Divider(height: 2,color: Colors.grey),
        padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
      ),
      ListTile(
        trailing: Icon(Icons.arrow_forward_ios),
        leading: Icon(Icons.network_check,color: Colors.black,),
        title: Text(
          'WebVPN',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        onTap: () {
          if(Global.account!="fangke"){
          Navigator.of(context)
                      .push(new MaterialPageRoute(builder: (_) {
                    return Browser(
                      url: "https://vpn.bjtuhbxy.cn",
                      title: "WebVPN",
                    );
                  }));
          }else{
            Toast.show("请先登录", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          }
        },
      ),

      //分割线
      Container(
        child: Divider(height: 2,color: Colors.grey),
        padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
      ),
      ListTile(
        trailing: Icon(Icons.arrow_forward_ios),
        leading: Icon(Icons.thumb_up,color:Colors.black),
        title: Text(
          '成绩查询',
          style: TextStyle(
            
            color: Colors.black
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/lists');
        },
      ),
      
      //分割线
      Container(
        child: Divider(height: 2,color: Colors.grey),
        padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
      ),
      ListTile(
        trailing: Icon(Icons.arrow_forward_ios),
        leading: Icon(Icons.turned_in,color:Colors.black),
        title: Text(
          '英语等级',
          style: TextStyle(
            
            color: Colors.black
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/cet');
        },
      ),

      //分割线
      Container(
        child: Divider(height: 2,color: Colors.grey),
        padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
      ),
      ListTile(
        trailing: Icon(Icons.arrow_forward_ios),
        leading: Icon(Icons.pets,color:Colors.black),
        title: Text(
          '考试查询',
          style: TextStyle(
            
            color: Colors.black
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/test');
        },
      ),

      //分割线
      Container(
        child: Divider(height: 2,color: Colors.grey),
        padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
      ),
      ListTile(
        trailing: Icon(Icons.arrow_forward_ios),
        leading: Icon(Icons.opacity,color:Colors.black),
        title: Text(
          '补考查询',
          style: TextStyle(
            
            color: Colors.black
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/retest');
        },
      ),

       //分割线
      Container(
        child: Divider(height: 2,color: Colors.grey),
        padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
      ),
      ListTile(
        trailing: Icon(Icons.arrow_forward_ios),
        leading: Icon(Icons.calendar_today,color:Colors.black),
        title: Text(
          '校历查询',
          style: TextStyle(
            
            color: Colors.black
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/calendar');
        },
      ),


     

      //分割线
      Container(
        child: Divider(height: 2,color: Colors.grey),
        padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
      ),
      ListTile(
        trailing: Icon(Icons.arrow_forward_ios),
        leading: Icon(Icons.remove_circle,color:Colors.black),
        title: Text(
          '退出登录',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        onTap: () {
          exit();
          print('执行退出帐号程序 清除系统帐号 密码缓存');
          Navigator.of(context).pushReplacementNamed('/login');
        },
      ),
      
    ]);
  }
   void exit() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    prefs.remove("account");
    prefs.remove("secret");
  }
}
