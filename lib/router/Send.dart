import 'package:flutter/material.dart';
import 'package:hbzs/model/datasave.dart';
import 'package:image_picker/image_picker.dart'; //调用相机 相册
import 'dart:io';
import 'package:photo/photo.dart'; //调用photo库
import 'package:photo_manager/photo_manager.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart'; //图片压缩
import 'dart:async';


// 相机组件
class SendPage extends StatefulWidget{
  var imagesShow;
  SendPage({this.imagesShow});
  @override
  State<StatefulWidget> createState() {
    print("---------------图片是否传递---------------------");
    print(imagesShow);
    return new SendPageState();
  }
}

class SendPageState extends State<SendPage> with WidgetsBindingObserver {

  List<Widget> _imageShow = [];

  // 获取的需要显示的数组
  List _imageUrlShow = [];

  var item; //数据封装

  Widget addImage;

  int index = 1;
  List<String> imageUrl = []; //存放偶像头像地址的数组

  File _image; //当前图片
  List<File> images = []; //记录所有图片
  List<Widget> ConList = []; //显示复数图片的数组
  //List<UploadFileInfo> _rq = []; //FormData内传递的值


  // 单张相机取图片
  Future getImage() async {

    var image = await ImagePicker.pickImage(source: ImageSource.camera); //相机
    _image = image;

    print(_image);
    images.add(_image);
    ff();


  }

  // 多张连选取图
  void _pickImage() async {

    List<AssetEntity> imgList = await PhotoPicker.pickAsset(
      //需要BuildContext
      context: context,

      ///以下是可选参数。
      ///themeColor: AppColors.colorPrimary,
      //标题颜色和底部颜色
      padding: 1.0,
      //项目填充
      dividerColor: Colors.grey,
      //分隔线颜色
      disableColor: Colors.grey.shade300,
      //复选框禁用颜色
      itemRadio: 0.88,
      //内容项目radio
      maxSelected: 8 - images.length -_imageUrlShow.length,
      //最大选择器图像计数
      provider: I18nProvider.chinese,
      //提供者：I18nProvider.chinese，
      // i18n提供者，默认为中文。 ，您可以自定义I18nProvider或使用ENProvider（）
      rowCount: 3,
      //项目行数
      textColor: Colors.white,
      //文字颜色
      thumbSize: 150,
      //预览拇指大小，默认为64
      sortDelegate: SortDelegate.common,
      //默认是常见的，或者您可以自定义委托来对图库进行排序
      checkBoxBuilderDelegate: DefaultCheckBoxBuilderDelegate(
        activeColor: Colors.white,
        unselectedColor: Colors.white,
      ),
      //默认为DefaultCheckBoxBuilderDelegate，或者您创建自定义委托以创建复选框

      //loadingDelegate: this,
      //如果你想构建自定义加载小部件，请扩展LoadingDelegate，[参见example / lib / main.dart]

      badgeDelegate: const DurationBadgeDelegate(),
    );

    //List<String> r = [];//路径
    for (var e in imgList) {
      _image = await e.file;
      //r.add(_image.absolute.path);//获取路径

      print(_image);
      images.add(_image);
    }

    ff();


  }

  // 处理图片
  void ff() {

    if (ConList.length > 1) {
      ConList.removeRange(1, ConList.length);
    }
    // 先读取传过来的图片，并显示
    if(_imageUrlShow.length!=0){
      for (var i = 0; i < _imageUrlShow.length; i++) {
        ConList.add(
          new Stack(
            alignment: const FractionalOffset(1.30, -0.3),
            children: <Widget>[
              Container(
                height: 95,
                width: 95,
                child: Image.network(_imageUrlShow[i]["image"], fit: BoxFit.cover),
              ),
              IconButton(

                iconSize: 20,
                icon: Container(

                  child: Icon(Icons.clear,color: Colors.black,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0), //10像素圆角

                  ),
                ),
                onPressed: () {
                  setState(() {
                    print("--------------------是否传递图片过来过---------------------------");
                    print(_imageUrlShow[i]["id"].toString());
                    print(ConList);
                    print(_imageUrlShow);

                    // 添加删除图片的id
                    SaveData.imagesRemoveId =
                        SaveData.imagesRemoveId +_imageUrlShow[i]["id"].toString()+"|";

                    //删除数组中存储的图片地址
                    var x = _imageUrlShow.remove(_imageUrlShow[i]);


                    print(x);
                    //删除组件
                    ConList.remove(ConList[i + 1]);

                    ff();
                  });
                },
              ),
            ],
          ),
        );
      }
    }


    // 在读取本地图片，并显示
    if(images.length!=0){
      for (var i = 0; i < images.length; i++) {
        ConList.add(
          new Stack(
            alignment: const FractionalOffset(1.30, -0.3),
            children: <Widget>[
              Container(
                height: 95,
                width: 95,
                child: Image.file(images[i], fit: BoxFit.cover),
              ),
              IconButton(
                color: Colors.grey[350],
                iconSize: 20,
                icon: Container(

                  child: Icon(Icons.clear,color: Colors.black,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0), //10像素圆角

                  ),
                ),
                onPressed: () {
                  setState(() {
                    //删除当前图片
                    _image = null;
                    //删除数组中存储的图片地址
                    var x = images.remove(images[i]);

                    print(x);
                    //删除组件
                    ConList.remove(ConList[i + 1]);
                    print(ConList);
                    ff();
                  });
                },
              ),
            ],
          ),
        );
      }
      _saveDate();
    }


    setState(() {});
  }

  // 封装数据
  Future _saveDate() async {

    //_rq.clear();

    //压缩图片并封装
    for (var i = 0, len = images.length; i < len; i++) {
      File file = images[i];

      file = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        Directory.systemTemp.path + '/head' + i.toString() + '.jpg',
        minWidth: 1920,
        minHeight: 1080,
        quality: 60,
      );

      // _rq.add(new UploadFileInfo(
      //     file, App.userid.toString() + i.toString() + ".jpg"));
    }

    SaveData.imagesListFlie   = images;
    //SaveData.imagesList   = _rq;

    print("图片文件数组长度"+SaveData.imagesListFlie.length.toString());
    print("图片上传数据流数组长度"+SaveData.imagesList.length.toString());

    return true;
  }

  @override
  void initState() {
    super.initState();
    _imageUrlShow = widget.imagesShow==null?
    []:
    widget.imagesShow;

    ConList.add(Container(
      color: Colors.grey[200],
      height: 95,
      width: 95,
      child: FlatButton(
          onPressed: () {
            //弹出底部弹窗
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          //背景装饰

                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: Center(
                                child: Center(
                                  child: Text(
                                    '请选择',
                                    style: TextStyle(color: Colors.black26,fontFamily:'appIconFonts'),
                                  ),
                                ),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              title: Center(
                                child: Text("拍照",style: TextStyle(fontFamily:'appIconFonts'),),
                              ),
                              onTap: () {
                                //调用相机
                                Navigator.of(context).pop();
                                images.length + _imageUrlShow.length < 8
                                    ? getImage()
                                    : print("don't more than 8 zhang ");
                              },
                            ),
                            Divider(),
                            ListTile(
                              title: Center(
                                child: Text("从本地相册选择",style: TextStyle(fontFamily:'appIconFonts'),),
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                                //读取相册
                                images.length + _imageUrlShow.length < 8
                                    ? _pickImage()
                                    : print("object");
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 10,
                        color: Colors.black26,
                      ),
                      ListTile(
                        title: Center(
                          child: Text(
                            "取消",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,fontFamily:'appIconFonts'
                            ),
                            textScaleFactor: 1.0,
                          ),
                        ),
                      ),
                    ],
                  );
                });
          },
          child: Icon(
            Icons.add_a_photo,
            color: Colors.black26,
          )),
    ));

    ff();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    print(ConList);


    return Container(
//
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 0.0),
        child: Container(
          child: Wrap(
            spacing: 8.0, // 主轴(水平)方向间距
            runSpacing: 4.0, // 纵轴（垂直）方向间距
            children: ConList,
          ),
        ));
  }
}