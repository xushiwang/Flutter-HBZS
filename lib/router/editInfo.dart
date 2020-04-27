import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditInfo extends StatefulWidget {
  EditInfo({Key key}) : super(key: key);

  @override
  _EditInfoState createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    var _passwordFieldKey;
    return SizedBox(
        height: 300,
        child: Scaffold(
            body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxisScrolled) {
                  return <Widget>[
                    SliverAppBar(
                        backgroundColor: Colors.white,
                        iconTheme: IconThemeData(color: Colors.black),
                        expandedHeight: 200.0,
                        floating: false,
                        pinned: true,
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Text(
                            "个人信息",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                          background: Image.network(
                              "https://img2.woyaogexing.com/2019/12/28/ebc0f9f2e4bd498283d51d96f878f391!400x400.jpeg",
                              fit: BoxFit.cover),
                        ),
                        actions: <Widget>[
                          IconButton(
                            icon: Icon(Icons.done),
                            color: Colors.black,
                            onPressed: () {
                              print("保存个人信息");
                            },
                          )
                        ])
                  ];
                },
                body: Text("data"))));
  }
}
