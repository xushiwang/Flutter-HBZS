import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadPage extends StatefulWidget {
  LoadPage({Key key}) : super(key: key);

  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  var flag =null;
  @override
  void initState() { 
    init();
    super.initState();
        Future.delayed(Duration(seconds:3),(){
         flag!=null? Navigator.of(context).pushReplacementNamed('/tabs'):Navigator.of(context).pushReplacementNamed('/login');
      
    });
  }
  init() async {
    final prefs = await SharedPreferences.getInstance();
     flag=prefs.getString("account");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
       child: Stack(
         children:<Widget>[
           Image.asset('images/loading.jpg',fit: BoxFit.cover,)
         ]
       )
    );
  }
}