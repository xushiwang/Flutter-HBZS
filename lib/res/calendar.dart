import 'package:flutter/material.dart';
import 'package:flutter_drag_scale/core/drag_scale_widget.dart';

class Calendar extends StatefulWidget {
  Calendar({Key key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            "校历查询",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: DragScaleContainer(
            doubleTapStillScale: true,
            child: new Image(
              image: new NetworkImage(
                  'http://www.bjtuhbxy.edu.cn/__local/3/E6/51/361B3910247673860D31211B8B1_CE375123_D1AD0.jpg'),
            ),
          ),
        ));
  }
}
