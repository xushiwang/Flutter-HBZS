import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
          elevation: 15,
          child: ListView(
          ///edit start
          padding: EdgeInsets.all(20),
          
          ///edit end
          children: <Widget>[
            
            Container(
              child: Text(
                '更多',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              
            ),
            //Text:Text('dsf'),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
              onTap: (){
                print('点击了设置');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
              onTap: (){
                print('点击了设置');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('账号与安全'),
              onTap: (){
                print('点击了账号与安全');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('通知设置'),
              onTap: (){
                print('点击了通知设置');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
              onTap: (){
                print('点击了设置');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('隐私'),
              onTap: (){
                print('点击了隐私');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_applications),
              title: Text('通用'),
              onTap: (){
                print('点击了通用');
              },
            ),
            ListTile(
              leading: Icon(Icons.golf_course),
              title: Text('鼓励一下'),
              onTap: (){
                print('点击了鼓励一下');
              },
            ),
            ListTile(
              leading: Icon(Icons.add_box),
              title: Text('关于海滨助手'),
              onTap: (){
                print('点击关于海滨助手');
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('帮助与客服'),
              onTap: (){
                print('点击了帮助与客服');
              },
            ),
          ],
        ),
        ),
    );
  }
}