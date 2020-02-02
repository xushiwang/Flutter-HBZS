
import 'package:flutter/material.dart';
import 'package:hbzs/pages/LoginPage/Browser.dart';

class MyTitleList extends StatelessWidget {
  const MyTitleList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      ListTile(
        leading: Icon(Icons.person),
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          '个人中心',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/beautiful');
        },
      ),

      //分割线
      Container(
        child: Divider(height: 2,color: Colors.grey),
        padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
      ),
      ListTile(
        trailing: Icon(Icons.arrow_forward_ios),
        leading: Icon(Icons.thumb_up),
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
        leading: Icon(Icons.turned_in),
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
        leading: Icon(Icons.pets),
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
        leading: Icon(Icons.opacity),
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
        leading: Icon(Icons.remove_circle),
        title: Text(
          '退出登录',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        onTap: () {
          print('执行退出帐号程序 清除系统帐号 密码缓存');
          Navigator.pushNamed(context, '/login');
        },
      ),
    ]);
  }
}
