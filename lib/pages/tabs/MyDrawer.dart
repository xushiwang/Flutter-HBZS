<<<<<<< 4c0dabc26c772d83fdd4c56121a8ce7856c653be
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
=======
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hbzs/pages/LoginPage/Browser.dart';
import 'package:path_provider/path_provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: Drawer(
          elevation: 15,
          child: ListView(
          //padding: EdgeInsets.zero,
          ///edit start
          //padding: EdgeInsets.all(20),
          ///edit end
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(20, 40, 0, 20),
              child: Text(
                '更多',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.perm_data_setting),
              ),
              title: Text('编辑资料'),
              onTap: (){
                print('https://api.asilu.com/bg/');
                Navigator.pushNamed(context, '/editinfo');
              },
            ),
            Container(
              child: Divider(),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                child: Icon(Icons.lock),
              ),
              title: Text('隐私'),
              onTap: (){
                print('点击了隐私');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.clear_all),
              ),
              title: Text('清理缓存'),
              onTap: (){
                _clearCache();
                print('清理缓存');
              },
            ),
            Container(
              child: Divider(),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.thumb_up),
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
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.live_help),
              ),
              title: Text('反馈与建议'),
              onTap: (){
                Navigator.of(context)
                      .push(new MaterialPageRoute(builder: (_) {
                    return new Browser(
                      url: "https://www.hbxy.xyz/fankui/",
                      title: "反馈与建议",
                    );
                  }));
              },
            ),
          ],
        ),
        ),
    ); 
  } 

  Future<DynamicLibrary> loadCache() async {
    Directory tempDir = await getTemporaryDirectory();
      double value = await _getTotalSizeOfFilesInDir(tempDir);
      tempDir.list(followLinks: false,recursive: true).listen((file){
          //打印每个缓存文件的路径
        print(file.path);
      });
      print('临时目录大小: ' + value.toString());
      // setState(() {
      //   _cacheSizeStr = _renderSize(value);  // _cacheSizeStr用来存储大小的值
      // });
      print(_renderSize(value));
  }
  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    if (file is File) {
         int length = await file.length();
         return double.parse(length.toString());
    }
   if (file is Directory) {
         final List<FileSystemEntity> children = file.listSync();
         double total = 0;
         if (children != null)
              for (final FileSystemEntity child in children)
                total += await _getTotalSizeOfFilesInDir(child);
         return total;
      }
      return 0;
  }

  _renderSize(double value) {
    if (null == value) {
      return 0;
    }
    List<String> unitArr = List()
      ..add('B')
      ..add('K')
      ..add('M')
      ..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }
  void _clearCache() async {
    Directory tempDir = await getTemporaryDirectory();
      //删除缓存目录
      await delDir(tempDir);
      await loadCache();
      print("缓存清理");
  }
  ///递归方式删除目录
  Future<Null> delDir(FileSystemEntity file) async {
    if (file is Directory) {
            final List<FileSystemEntity> children = file.listSync();
            for (final FileSystemEntity child in children) {
              await delDir(child);
            }
          }
      await file.delete();
  }
>>>>>>> messagfe
}