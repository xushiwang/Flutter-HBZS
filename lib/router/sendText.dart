import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hbzs/common/global.dart';
import 'package:toast/toast.dart';

class SendText extends StatefulWidget {
  SendText({Key key}) : super(key: key);

  @override
  _SendTextState createState() => _SendTextState();
}

class _SendTextState extends State<SendText> {
  String info = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("发表文字", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            color: Colors.black,
            onPressed: () {
              if(info==""){
                Toast.show("不能发表空消息哦！",context,duration: 3);
              }else{
                send();
              }
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          // Text(
          //   "",
          //   style: TextStyle(fontSize: 18),
          // ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              onChanged: (val) {
                setState(() {
                  info = val;
                });
              },
              decoration: const InputDecoration(
              
                border: OutlineInputBorder(
                  
                ),
                hintText: '',
                focusColor: Colors.black,
                fillColor: Colors.black,
                hoverColor: Colors.black
                // helperText: ' 快来分享你的故事',
                // labelText: 'Life story',
              ),
              maxLines: 8,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> send() async {
    Dio dio = new Dio();
    Map<String, String> map = {
      'uid': Global.account,
      'img_url': "",
      'context': info
    };
    print(map);
    FormData formData = FormData.fromMap(map);
    Response response = await dio.post(
      Global.send_message,
      data: formData,
    );
    if (response.statusCode == 200) {
      print(response.toString());
      if (response.data == 200) {
        Toast.show("动态发布成功", context, duration: 4);
        Navigator.pop(context);
      }else{
        Toast.show("网络错误", context);
      }
    }
  }
}
