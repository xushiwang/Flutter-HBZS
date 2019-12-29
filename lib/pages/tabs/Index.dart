import 'package:flutter/material.dart';
class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon:Icon(Icons.find_in_page),
            color: Colors.grey,
            onPressed: (){
              print("添加好友");
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.grey,
              onPressed: (){
                print("打开发布动态页面");
              },
            )
          ],
          title: Text(
            "首页",
            style: TextStyle(
              color: Colors.grey
              ),
            ),
          centerTitle: true,
          ),
        body: Layout(),
      ),
    );
  }
}
class Layout extends StatelessWidget {
  const Layout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        //所有元素都底部居中
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: 400,
            width: 300,
            color: Colors.pink,
          ),
          Text(
            "-- The End --",
            style: TextStyle(color: Colors.grey)
          )
        ],
      ),
    );
  }
}