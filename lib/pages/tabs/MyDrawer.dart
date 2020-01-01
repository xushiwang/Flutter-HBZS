import 'package:flutter/material.dart';
import 'package:hbzs/res/customview.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
          elevation: 15,
          child: ListView(
          padding: EdgeInsets.zero,
          ///edit start
          //padding: EdgeInsets.all(20),
          
          ///edit end
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                '更多',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              
            ),
            //Text:Text('dsf'),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text('设置'),
              onTap: (){
                print('点击了设置');
              },
            ),
            Container(
              child: Divider(),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              title: Text('设置'),
              onTap: (){
                print('点击了设置');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.account_circle),
              ),
              title: Text('账号与安全'),
              onTap: (){
                print('点击了账号与安全');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.notification_important),
              ),
              title: Text('通知设置'),
              onTap: (){
                print('点击了通知设置');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text('设置'),
              onTap: (){
                print('点击了设置');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.lock),
              ),
              title: Text('隐私'),
              onTap: (){
                print('点击了隐私');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.unarchive),
              ),
              title: Text('通用'),
              onTap: (){
                print('点击了通用');
              },
            ),
            Container(
              child: Divider(),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.gavel),
              ),
              title: Text('鼓励一下'),
              onTap: (){
                print('点击了鼓励一下');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.info),
              ),
              title: Text('关于海滨助手'),
              onTap: (){
                print('点击关于海滨助手');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.live_help),
              ),
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