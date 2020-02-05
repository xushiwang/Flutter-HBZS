import 'package:flutter/material.dart';

class Echarts extends StatefulWidget {
  Echarts({Key key}) : super(key: key);

  @override
  _EchartsState createState() => _EchartsState();
}

class _EchartsState extends State<Echarts> {
  @override
  Widget build(BuildContext context) {
    var option = {
      "xAxis": {
        "type": "category",
        "data": ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
      },
      "yAxis": {"type": "value"},
      "series": [
        {
          "data": [820, 932, 901, 934, 1290, 1330, 1320],
          "type": "line"
        }
      ]
    };
    return Container(
       child: new SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                new Text('Native WebView as Widget\n\n'),
                new Container(
                  child: Text("data"),
                  height: 300.0,
                  width: 500.0,
                ),
              ],
            ),
          ) 
    );
  }
}