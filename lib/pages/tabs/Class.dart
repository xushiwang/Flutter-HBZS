import 'package:flutter/material.dart';
import 'package:hbzs/res/classData.dart';

class ClassPage extends StatefulWidget {
  ClassPage({Key key}) : super(key: key);

  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  List<Widget> _getListData(){
    var tempList = classData.map((value){
      return Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              value['keming']+value['didian'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12
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
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "第十六周",
              style: TextStyle(
                color: Colors.grey,
              ),),
            bottom: TabBar(
              indicatorColor: Color.fromARGB(255, 216,30, 6),//指示器颜色
              labelColor: Color.fromARGB(255, 216,30, 6),
              // labelStyle: TextStyle(
              //   color: Color.fromARGB(255, 216,30, 6)
              //   ),//网易红
              unselectedLabelColor: Colors.black,
              indicatorWeight: 2.0,
              tabs: <Widget>[
                Tab(text: "我的课表"),
                Tab(text: "ta的课表"),
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            //first 
            GridView.count(
              // crossAxisSpacing: 1.0,//左右间距
              // mainAxisSpacing: 1.0,//上下间距
              crossAxisCount: 6,
              //padding: EdgeInsets.all(10),//四周缩进
              children: this._getListData(),
              childAspectRatio: 0.7,//长：宽比例
            ),
            //secont
            GridView.count(
              // crossAxisSpacing: 1.0,//左右间距
              // mainAxisSpacing: 1.0,//上下间距
              crossAxisCount: 6,
              //padding: EdgeInsets.all(10),//四周缩进
              children: this._getListData(),
              childAspectRatio: 0.7,//长：宽比例
            ),
          ]
        ),
        //   appBar: AppBar(
        //   leading: Image.network('https://img2.woyaogexing.com/2019/12/28/ebc0f9f2e4bd498283d51d96f878f391!400x400.jpeg'),
        //   title: ButtonBar(),
        //     backgroundColor: Color.fromRGBO(216, 30, 36, 0.8),
        //   ),
        // body: Text('sdf')
        ),
      ),
    );
  }
}