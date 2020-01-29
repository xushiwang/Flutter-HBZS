<<<<<<< 4c0dabc26c772d83fdd4c56121a8ce7856c653be
import 'package:flutter/material.dart';

class SendPage extends StatelessWidget {
  const SendPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        title: Text('发布动态'),
      ),
      body: Text('sds'),
    );
  }
=======
import 'package:flutter/material.dart';

class SendPage extends StatelessWidget {
  const SendPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:Colors.white,
        title: Text('发布动态'),
        centerTitle: true,
      ),
      body: Text('123456789'),
    );
  }
>>>>>>> messagfe
}