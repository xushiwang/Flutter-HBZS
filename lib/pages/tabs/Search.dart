<<<<<<< 4c0dabc26c772d83fdd4c56121a8ce7856c653be
import 'package:flutter/material.dart';
import 'package:hbzs/res/listData.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Widget> _getListData(){

    var tempList = listData.map((value){
      return Container(
        child: Column(
          children: <Widget>[
            Image.network(value['imageUrl']),
            SizedBox(height: 10),
            Text(
              value['title'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20
              ),
              )
          ],
        ),

        decoration: BoxDecoration(
          border: Border.all(
            color:Color.fromRGBO(233, 233, 233, 0.9),
            width: 2
          )
        ),
      );
    });
    return tempList.toList();
    // List<Widget> list = new List();
    // for(var i=0;i<20;i++){
    //   list.add(Container(
    //     alignment: Alignment.center,
    //     child: Text(
    //       '这是第$i条数据',
    //       style: TextStyle(color: Colors.white,fontSize: 20),
    //     ),
    //     color: Colors.blue,
    //   ));
    // }
    // return list;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('查询'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body:Column(
        children: <Widget>[
          // GridView.count(
          //   crossAxisSpacing: 5.0,//左右间距
          //   mainAxisSpacing: 5.0,//上下间距
          //   crossAxisCount: 3,
          //   padding: EdgeInsets.all(10),//四周缩进
          //   children: this._getListData(),
          //   childAspectRatio: 0.7,//长：宽比例
          // )
        ],
      )  
      
    ); 
  }
}
=======
import 'package:flutter/material.dart';
import 'package:hbzs/res/listData.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('查询'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
    ); 
  }
}
>>>>>>> messagfe
