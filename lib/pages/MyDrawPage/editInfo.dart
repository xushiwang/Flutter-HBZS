import 'package:flutter/material.dart';
class EditInfo extends StatelessWidget {
  List list = ["images/xh.gif", "images/bg.jpg", "images/dt.png", "images/xx.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //每行放几个item
            childAspectRatio: 1 //每个item的长宽比例
            ),
        itemCount: 4, //一个构造多少个Item
        itemBuilder: (context, index) {
          return RaisedButton(
              elevation: 5.0, //按钮的阴影
              padding: EdgeInsets.all(0), //按钮上的文本距离按钮的边界的距离
              color: Color.fromARGB(255, 207, 169, 114), //设置按钮的颜色
              onLongPress: () {
                //长按按钮的事件
                print("长按事件");
              },
              onPressed: (){
                print("点击事件");
              },
              child:Image.asset(list[index]),  
          );
        },
      ),
    );
  }
}