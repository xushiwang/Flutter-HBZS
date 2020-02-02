
import 'package:flutter/material.dart';
class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          '消息',
          style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.message),
            color: Colors.black,
            onPressed: (){
              Navigator.pushNamed(context, '/chat');
            },
          ),
        ],
      ),
       body: Message(),
    );
  }
}
class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.all(18.0),
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Row(
              children: <Widget>[
                new Icon(
                  Icons.message,
                  color: Colors.black26,
                  size: 17.0,
                ),
                new Container(
                  margin: new EdgeInsets.only(left: 5.0),
                  child: new Text(
                    '消息',
                    style: new TextStyle(color: Color(0xFF888888)),
                  ),
                )
              ],
            ),
          ),
          new Divider(
            color: Color(0xFF888888),
          ),
          new Container(
            margin: new EdgeInsets.all(10.0),
            child: new Text("这里是消息"),
          ),
          new Divider(
            color: Color(0xFF888888),
          )
        ],
      ),
    );
  }
}
