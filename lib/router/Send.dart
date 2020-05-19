import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hbzs/common/global.dart';

import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class SendPage extends StatefulWidget {
  SendPage({Key key}) : super(key: key);

  @override
  _FaBuState createState() => _FaBuState();
}

class _FaBuState extends State<SendPage> {
  String info = null;

  //记录选择的照片
  File _image;
  //当图片上传成功后，记录当前上传的图片在服务器中的位置
  String _imgServerPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("发表动态", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            color: Colors.black,
            onPressed: () {
              if (info == "") {
                Toast.show("不能发表空消息哦！", context, duration: 3);
              } else {
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
          //   "    快来分享你的故事",
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
                border: OutlineInputBorder(),
                //hintText: '最多不要超过200个字哦！',
                // helperText: ' 快来分享你的故事',
                // labelText: 'Life story',
              ),
              maxLines: 8,
            ),
          ),
          Row(children: <Widget>[
            // Text(
            //   "    选择照片",
            //   style: TextStyle(fontSize: 18),
            // ),
            IconButton(
              icon: Icon(Icons.photo),
              alignment: Alignment.bottomLeft,
              onPressed: () {
                _getImageFromGallery();
              },
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              // child: IconButton(icon: Icon(Icons.done), onPressed: () {
              //   _uploadImage();
              // }),
              child: SizedBox(
                width: 10,
              ),
            ),
            // new RaisedButton(
            //   child: new Text("发布"),
            //   color: Colors.blue,
            //   textColor: Colors.white,
            //   onPressed: () {
            //     send();
            //   },
            //   disabledColor: Colors.grey,
            //   disabledTextColor: Colors.white,
            //   disabledElevation: 4,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20.0)), //圆角大小
            // ),
            SizedBox(
              width: 10,
            )
          ]),
          Container(
              height: 400,
              padding: EdgeInsets.all(1),
              child: this._imgServerPath == null
                  ? Center(child: Text("还未选择任何照片"))
                  : Image.network(_imgServerPath))
        ],
      ),
    );
  }

  Future _getImageFromCamera() async {
    var image =
        await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 400);
    setState(() {
      _image = image;
      _uploadImage();
    });
  }

  //相册选择
  Future _getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      _uploadImage();
    });
  }

  //上传图片到服务器
  _uploadImage() async {
    String path = _image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length); //获取名字
    print(name);
    FormData formData = FormData.fromMap(
        {"file": await MultipartFile.fromFile(_image.path, filename: name)});
    Dio dio = new Dio();
    dio.options.responseType = ResponseType.plain;
    var response = await dio
        .post("http://upload.image.hbxy.xyz/dongtai/index.php", data: formData);
    print(response);
    if (response.statusCode == 200) {
      print(response.data.toString());
      setState(() {
        _imgServerPath = "http://" + response.data.toString();
        Toast.show("上传成功", context);
      });
    }
  }

  Future<void> send() async {
    Dio dio = new Dio();
    Map<String, String> map = {
      'uid': Global.account,
      'img_url': _imgServerPath,
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
        Toast.show("动态发布成功", context, duration: 3);
        Navigator.pop(context);
      } else {
        Toast.show("发布失败", context, duration: 3);
      }
    }
  }
}
