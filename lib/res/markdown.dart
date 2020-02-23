import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
class MarkDown extends StatefulWidget {
  MarkDown({Key key}) : super(key: key);

  @override
  _MarkDownState createState() => _MarkDownState();
}
String txt="";  
class _MarkDownState extends State<MarkDown> {
  
  @override
  void initState() {
    getHttp().then((val){
      setState(() {
        txt=val;
      });
    });

  }
   Future getHttp() async {
    try {
      Response response;
      Dio dio = new Dio();
      response =
          await dio.get("https://xushiwang.github.io/update_logs.txt");
      print(response.data.toString());
      return response.data;
    } catch (e) {
      return print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("更新日志", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Markdown(data: txt.toString())
    );
  }
}