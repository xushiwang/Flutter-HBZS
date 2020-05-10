import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hbzs/common/global.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class Avator extends StatefulWidget {
  Avator({Key key}) : super(key: key);

  @override
  _AvatorState createState() => _AvatorState();
}
//记录选择的照片
File _image;
//当图片上传成功后，记录当前上传的图片在服务器中的位置
String _imgServerPath;
String img_url;

class _AvatorState extends State<Avator> {
  @override
  Widget build(BuildContext context) {
    img_url = Global.avator_img_url;
    print(img_url);
    return Scaffold(
        backgroundColor: Colors.black,
        body: img_url ==null
            ? Center(
                child: CircularProgressIndicator(backgroundColor: Colors.grey))
            : Column(children: <Widget>[
                Expanded(child: Column()),
                Center(child: Image.network(img_url)),
                Expanded(
                    child: Center(
                        child: OutlineButton(
                  borderSide: new BorderSide(color: Colors.white),
                  onPressed: () {
                    selectAvator();
                  },
                  child: Text("更换头像"),
                  textColor: Colors.white,
                  color: Colors.white,
                )))
              ]));
  }
  selectAvator() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      _uploadImage();
    });
  }
  //上传图片到服务器
  _uploadImage() async {
    final prefs = await SharedPreferences.getInstance();
    String path = _image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length); //获取名字
    print(name);
    FormData formData = FormData.fromMap(
        {"file": await MultipartFile.fromFile(_image.path, filename: name)});
    Dio dio = new Dio();
    dio.options.responseType = ResponseType.plain;
    var response = await dio
        .post("https://upload.image.hbxy.xyz/dongtai/index.php", data: formData);
    print(response);
    if (response.statusCode == 200) {
      print(response.data.toString());
      
      setState(() {
        _imgServerPath = "https://" + response.data.toString();
        Global.avator_img_url = _imgServerPath;
        prefs.setString("avator_img", Global.avator_img_url);
        Toast.show("上传成功", context);
        // setState(() {
        //   img_url =_imgServerPath;
        // });
        Navigator.pop(context,Global.avator_img_url);
      });
    }
  }
}
