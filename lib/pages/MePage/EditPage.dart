import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  // const SendPage({Key key}) : super(key: key);
  String title;
  EditPage({this.title="biaodan"});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        title: Text('编辑资料'),
      ),
      body: Text('编辑资料页面'),
    );
  }
}