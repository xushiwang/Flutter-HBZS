
import 'package:flutter/material.dart';
import 'package:hbzs/res/meData.dart';

class MePage extends StatefulWidget {
  MePage({Key key}) : super(key: key);

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {

  List<Widget> _getData(){
    var tempList = meData.map((value){
      return ListTile(
        leading: Image.network(value['imageUrl']),
        title: Text(value["title"]),
        subtitle: Text(value["author"]),
      );
    });
    return tempList.toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   '我',
        //   style: TextStyle(color: Colors.black)),
        //backgroundColor: Color.fromARGB(255, 216,30, 6),//网易红
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.home),
          color: Colors.black,
          onPressed: (){
            print('打开个人中心');
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            color: Colors.black,
            onPressed: (){
              print('分享1');
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            color: Colors.black,
            onPressed: (){
              print('分享2');
            },
          )
        ],
      ),
      //backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: ListView(
          children: this._getData()
        )
      ),
      
    );
  }
}