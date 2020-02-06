import 'package:flutter/material.dart';
import 'package:hbzs/res/Browser.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('关于'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            leading: new FlutterLogo(),
            title: new Text('海滨助手'),
            subtitle: new Text("v1.0 \nDesign by 许仕旺  自由程序员/独立开发者"),
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(Icons.shop),
            title: new Text('谷歌应用商店'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                return new Browser(
                  url: "https://play.google.com/",
                  title: "谷歌应用商店",
                );
              }));
            },
          ),
          new ListTile(
            leading: new Icon(Icons.code),
            title: new Text('GitHub查看源码'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                return new Browser(
                  url: "https://github.com/xushiwang/",
                  title: "GitHub查看源码",
                );
              }));
            },
          ),
          new ListTile(
            leading: new Icon(Icons.web),
            title: new Text('软件官网'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                return new Browser(
                  url: "https://www.hbxy.xyz",
                  title: "软件官网",
                );
              }));
            },
          ),
          new ListTile(
            leading: new Icon(Icons.phone),
            title: new Text('联系与合作'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              launch("tel:+8615511581179");
            },
          ),
          new Divider(),
          Text("特别感谢各位老师同学给予的支持与帮助",textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
