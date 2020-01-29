<<<<<<< 4c0dabc26c772d83fdd4c56121a8ce7856c653be
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
=======
import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  // const SendPage({Key key}) : super(key: key);
  String title;
  EditPage({this.title="biaodan"});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor:Colors.white,
        title: Text('编辑资料'),
      ),
      body: Text('编辑资料页面'),
    );
  }
>>>>>>> messagfe
}