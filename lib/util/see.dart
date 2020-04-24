import 'package:flutter/material.dart';
import 'package:flutter_drag_scale/flutter_drag_scale.dart';
import 'package:flutter/material.dart';
class See extends StatefulWidget {
  See({Key key}) : super(key: key);

  @override
  _SeeState createState() => _SeeState();
}
String txt="";  
class _SeeState extends State<See> {
  
  // @override
  // void initState() {
  //   getHttp();
  // }
  // getHttp() async {
  //   try {
  //     Response response;
  //     Dio dio = new Dio();
  //     response =
  //         await dio.get("https://xushiwang.github.io/update_logs.txt");
  //     print(response.data.toString());
  //     setState(() {
  //       txt=response.data.toString();
  //     });
  //     return response.data;
  //   } catch (e) {
  //     return print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      width: 400,
      child: Center(
        child: DragScaleContainer(
          doubleTapStillScale: true,
          child: new Image(
            image: new NetworkImage(
                'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
          ),
        ),
      ),
    );
  }
}