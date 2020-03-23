import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ShowMD extends StatelessWidget {
  const ShowMD({Key key, this.txt}) : super(key: key);

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color:Colors.black),
        backgroundColor: Colors.white,
        title: Text("赞赏记录",style: TextStyle(color:Colors.black),),
        centerTitle: true,
      ),
      body:txt==""?Center(child: CircularProgressIndicator(backgroundColor: Colors.grey,)):Markdown(data: txt.toString())
    );
  }
}