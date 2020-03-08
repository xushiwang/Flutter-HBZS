import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Echarts extends StatefulWidget {
  @override
  _EchartsState createState() => _EchartsState();
}

class _EchartsState extends State<Echarts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("数据分析", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              child: getLine(),
            )
          ],
        ),
      ),
    );
  }

  Widget getLine() {
    List<Linesales> dataLine = [
      new Linesales(1, 394),
      new Linesales(2, 391),
      new Linesales(3, 385),
      new Linesales(4, 431),
    ];

    var seriesLine = [
      charts.Series<Linesales, DateTime>(
        data: dataLine,
        measureFn: (Linesales lines, _) => lines.cs,
        measureFn: (Linesales lines, _) => lines.sale,
        id: "Lines",
      )
    ];
    //是TimeSeriesChart，而不是LineChart,因为x轴是DataTime类
    Widget line = charts.TimeSeriesChart(seriesLine);
    //line = charts.LineChart(series);
    return line;
  }
}

class Linesales {
  int cs;
  int sale;
  Linesales(this.cs, this.sale);
}
