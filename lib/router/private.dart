import 'package:flutter/material.dart';
import 'package:hbzs/services/local_authentication_service.dart';
import 'package:hbzs/services/service_locator.dart';

class Private extends StatefulWidget {
 @override
 _PrivateState createState() => _PrivateState();
}

class _PrivateState extends State<Private> {
 final LocalAuthenticationService _localAuth = locator<LocalAuthenticationService>();

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       leading: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Image.asset('assets/dancamdev.png'),
       ),
       title: Text('Local Authentication'),
     ),
     body: Center(
       child: RaisedButton(
         child: Text('authenticate'),
         onPressed: _localAuth.authenticate,
       ),
     ),
   );
 }
}