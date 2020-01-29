import 'dart:convert';
// 这里需要替换为实体类所在路径
import 'package:dio/dio.dart';
import 'package:hbzs/model/kb_data.dart';
import 'package:hbzs/res/classData.dart';
Future<void> main() async {
  // 解析对象
  //print(classData1);
  //print(classData1 is Map);
  
  Dio dio = new Dio();
  Response response = await dio.get("https://xxzx.bjtuhbxy.edu.cn/get_week");
  //print(response.data.toString());
  //return response.statusCode.toInt();
  Map<String, dynamic> text = json.decode(response.data.toString());
  print("${text['interval']}");
  print("${text['flag']}");
  var a = "${text['flag']}";
  print(a);

  Map<String, dynamic> map = classData1;
  KbData data = KbData.fromJson(map);
  if(data.kbFlag == 1){
    //print(info.information);
    print(data.information.xy);//班级
    print(data.information.zy);
    print(data.information.bj);
    print(data.information.xm);
    print(data.information.xh);
    print(data.information.xn);
    print(data.information.xq);
    if(data.kb.mon1.kbFlag == 1){
      for(int i=0;i<data.kb.mon1.classCurrent.length;i++){
        data.kb.mon1.classCurrent[i].forEach((k,v) => print('${v}'));//只打印数值
        //data.kb.mon1.classCurrent[1].forEach((k,v) => print('${k}: ${v}')); 
        print("数组长度:"+data.kb.mon1.classCurrent.length.toString());
      }
     
      //print(data.kb.mon1.classCurrent.length is int);
      // for(int i=0;i < data.kb.mon1.classCurrent.length; i++){
      //   print("teacher:"+data.kb.mon1.classCurrent[i].teacher.toString());
      //   print("location:"+data.kb.mon1.classCurrent[i].location.toString());
      //   print("course:"+data.kb.mon1.classCurrent[i].course.toString());
      //   print("time:"+data.kb.mon1.classCurrent[i].time.toString());
      //   print("js_xs:"+data.kb.mon1.classCurrent[i].jsXs.toString());
      //   print("start:"+data.kb.mon1.classCurrent[i].start.toString());
      //   print("end:"+data.kb.mon1.classCurrent[i].end.toString());
      // }
    }
    if(data.kb.mon2.kbFlag == 1){
      // print("teacher:"+data.kb.mon2.classCurrent[0].teacher.toString());
      // print("location:"+data.kb.mon2.classCurrent[0].location.toString());
      // print("course:"+data.kb.mon2.classCurrent[0].course.toString());
      // print("time:"+data.kb.mon2.classCurrent[0].time.toString());
      // print("js_xs:"+data.kb.mon2.classCurrent[0].jsXs.toString());
      // print("start:"+data.kb.mon2.classCurrent[0].start.toString());
      // print("end:"+data.kb.mon2.classCurrent[0].end.toString());
      for(int i=0;i<data.kb.mon1.classCurrent.length;i++){
        data.kb.mon1.classCurrent[i].forEach((k,v) => print('${v}'));//只打印数值
        //data.kb.mon1.classCurrent[1].forEach((k,v) => print('${k}: ${v}')); 
        print("数组长度:"+data.kb.mon1.classCurrent.length.toString());
      }
    }
    if(data.kb.mon3.kbFlag == 1){
      print("teacher:"+data.kb.mon3.classCurrent[0].teacher.toString());
      print("location:"+data.kb.mon3.classCurrent[0].location.toString());
      print("course:"+data.kb.mon3.classCurrent[0].course.toString());
      print("time:"+data.kb.mon3.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.mon3.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.mon3.classCurrent[0].start.toString());
      print("end:"+data.kb.mon3.classCurrent[0].end.toString());
    }
    if(data.kb.mon4.kbFlag == 1){
      print("teacher:"+data.kb.mon4.classCurrent[0].teacher.toString());
      print("location:"+data.kb.mon4.classCurrent[0].location.toString());
      print("course:"+data.kb.mon4.classCurrent[0].course.toString());
      print("time:"+data.kb.mon4.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.mon4.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.mon4.classCurrent[0].start.toString());
      print("end:"+data.kb.mon4.classCurrent[0].end.toString());
    }
    if(data.kb.mon5.kbFlag == 1){
      print("teacher:"+data.kb.mon5.classCurrent[0].teacher.toString());
      print("location:"+data.kb.mon5.classCurrent[0].location.toString());
      print("course:"+data.kb.mon5.classCurrent[0].course.toString());
      print("time:"+data.kb.mon5.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.mon5.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.mon5.classCurrent[0].start.toString());
      print("end:"+data.kb.mon5.classCurrent[0].end.toString());
    }
    if(data.kb.tues1.kbFlag == 1){
      print("teacher:"+data.kb.tues1.classCurrent[0].teacher.toString());
      print("location:"+data.kb.tues1.classCurrent[0].location.toString());
      print("course:"+data.kb.tues1.classCurrent[0].course.toString());
      print("time:"+data.kb.tues1.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.tues1.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.tues1.classCurrent[0].start.toString());
      print("end:"+data.kb.tues1.classCurrent[0].end.toString());
    }
    if(data.kb.tues2.kbFlag == 1){
      print("teacher:"+data.kb.tues2.classCurrent[0].teacher.toString());
      print("location:"+data.kb.tues2.classCurrent[0].location.toString());
      print("course:"+data.kb.tues2.classCurrent[0].course.toString());
      print("time:"+data.kb.tues2.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.tues2.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.tues2.classCurrent[0].start.toString());
      print("end:"+data.kb.tues2.classCurrent[0].end.toString());
    }
    if(data.kb.tues3.kbFlag == 1){
      print("teacher:"+data.kb.tues3.classCurrent[0].teacher.toString());
      print("location:"+data.kb.tues3.classCurrent[0].location.toString());
      print("course:"+data.kb.tues3.classCurrent[0].course.toString());
      print("time:"+data.kb.tues3.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.tues3.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.tues3.classCurrent[0].start.toString());
      print("end:"+data.kb.tues3.classCurrent[0].end.toString());
    }
    if(data.kb.tues4.kbFlag == 1){
      print("teacher:"+data.kb.tues4.classCurrent[0].teacher.toString());
      print("location:"+data.kb.tues4.classCurrent[0].location.toString());
      print("course:"+data.kb.tues4.classCurrent[0].course.toString());
      print("time:"+data.kb.tues4.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.tues4.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.tues4.classCurrent[0].start.toString());
      print("end:"+data.kb.tues4.classCurrent[0].end.toString());
    }
    if(data.kb.tues5.kbFlag == 1){
      print("teacher:"+data.kb.tues5.classCurrent[0].teacher.toString());
      print("location:"+data.kb.tues5.classCurrent[0].location.toString());
      print("course:"+data.kb.tues5.classCurrent[0].course.toString());
      print("time:"+data.kb.tues5.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.tues5.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.tues5.classCurrent[0].start.toString());
      print("end:"+data.kb.tues5.classCurrent[0].end.toString());
    }
    if(data.kb.wed1.kbFlag == 1){
      print("teacher:"+data.kb.wed1.classCurrent[0].teacher.toString());
      print("location:"+data.kb.wed1.classCurrent[0].location.toString());
      print("course:"+data.kb.wed1.classCurrent[0].course.toString());
      print("time:"+data.kb.wed1.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.wed1.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.wed1.classCurrent[0].start.toString());
      print("end:"+data.kb.wed1.classCurrent[0].end.toString());
    }
    if(data.kb.wed2.kbFlag == 1){
      print("teacher:"+data.kb.wed2.classCurrent[0].teacher.toString());
      print("location:"+data.kb.wed2.classCurrent[0].location.toString());
      print("course:"+data.kb.wed2.classCurrent[0].course.toString());
      print("time:"+data.kb.wed2.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.wed2.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.wed2.classCurrent[0].start.toString());
      print("end:"+data.kb.wed2.classCurrent[0].end.toString());
    }
    if(data.kb.wed3.kbFlag == 1){
      print("teacher:"+data.kb.wed3.classCurrent[0].teacher.toString());
      print("location:"+data.kb.wed3.classCurrent[0].location.toString());
      print("course:"+data.kb.wed3.classCurrent[0].course.toString());
      print("time:"+data.kb.wed3.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.wed3.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.wed3.classCurrent[0].start.toString());
      print("end:"+data.kb.wed3.classCurrent[0].end.toString());
    }
    if(data.kb.wed4.kbFlag == 1){
      print("teacher:"+data.kb.wed4.classCurrent[0].teacher.toString());
      print("location:"+data.kb.wed4.classCurrent[0].location.toString());
      print("course:"+data.kb.wed4.classCurrent[0].course.toString());
      print("time:"+data.kb.wed4.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.wed4.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.wed4.classCurrent[0].start.toString());
      print("end:"+data.kb.wed4.classCurrent[0].end.toString());
    }
    if(data.kb.wed5.kbFlag == 1){
      print("teacher:"+data.kb.wed5.classCurrent[0].teacher.toString());
      print("location:"+data.kb.wed5.classCurrent[0].location.toString());
      print("course:"+data.kb.wed5.classCurrent[0].course.toString());
      print("time:"+data.kb.wed5.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.wed5.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.wed5.classCurrent[0].start.toString());
      print("end:"+data.kb.wed5.classCurrent[0].end.toString());
    }
    if(data.kb.thur1.kbFlag == 1){
      print("teacher:"+data.kb.thur1.classCurrent[0].teacher.toString());
      print("location:"+data.kb.thur1.classCurrent[0].location.toString());
      print("course:"+data.kb.thur1.classCurrent[0].course.toString());
      print("time:"+data.kb.thur1.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.thur1.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.thur1.classCurrent[0].start.toString());
      print("end:"+data.kb.thur1.classCurrent[0].end.toString());
    }
    if(data.kb.thur2.kbFlag == 1){
      print("teacher:"+data.kb.thur2.classCurrent[0].teacher.toString());
      print("location:"+data.kb.thur2.classCurrent[0].location.toString());
      print("course:"+data.kb.thur2.classCurrent[0].course.toString());
      print("time:"+data.kb.thur2.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.thur2.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.thur2.classCurrent[0].start.toString());
      print("end:"+data.kb.thur2.classCurrent[0].end.toString());
    }
    if(data.kb.thur3.kbFlag == 1){
      print("teacher:"+data.kb.thur3.classCurrent[0].teacher.toString());
      print("location:"+data.kb.thur3.classCurrent[0].location.toString());
      print("course:"+data.kb.thur3.classCurrent[0].course.toString());
      print("time:"+data.kb.thur3.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.thur3.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.thur3.classCurrent[0].start.toString());
      print("end:"+data.kb.thur3.classCurrent[0].end.toString());
    }
    if(data.kb.thur4.kbFlag == 1){
      print("teacher:"+data.kb.thur4.classCurrent[0].teacher.toString());
      print("location:"+data.kb.thur4.classCurrent[0].location.toString());
      print("course:"+data.kb.thur4.classCurrent[0].course.toString());
      print("time:"+data.kb.thur4.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.thur4.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.thur4.classCurrent[0].start.toString());
      print("end:"+data.kb.thur4.classCurrent[0].end.toString());
    }
    if(data.kb.thur5.kbFlag == 1){
      print("teacher:"+data.kb.thur5.classCurrent[0].teacher.toString());
      print("location:"+data.kb.thur5.classCurrent[0].location.toString());
      print("course:"+data.kb.thur5.classCurrent[0].course.toString());
      print("time:"+data.kb.thur5.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.thur5.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.thur5.classCurrent[0].start.toString());
      print("end:"+data.kb.thur5.classCurrent[0].end.toString());
    }
    if(data.kb.fri1.kbFlag == 1){
      print("teacher:"+data.kb.fri1.classCurrent[0].teacher.toString());
      print("location:"+data.kb.fri1.classCurrent[0].location.toString());
      print("course:"+data.kb.fri1.classCurrent[0].course.toString());
      print("time:"+data.kb.fri1.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.fri1.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.fri1.classCurrent[0].start.toString());
      print("end:"+data.kb.fri1.classCurrent[0].end.toString());
    }
    if(data.kb.fri2.kbFlag == 1){
      print("teacher:"+data.kb.fri2.classCurrent[0].teacher.toString());
      print("location:"+data.kb.fri2.classCurrent[0].location.toString());
      print("course:"+data.kb.fri2.classCurrent[0].course.toString());
      print("time:"+data.kb.fri2.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.fri2.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.fri2.classCurrent[0].start.toString());
      print("end:"+data.kb.fri2.classCurrent[0].end.toString());
    }
    if(data.kb.fri3.kbFlag == 1){
      print("teacher:"+data.kb.fri3.classCurrent[0].teacher.toString());
      print("location:"+data.kb.fri3.classCurrent[0].location.toString());
      print("course:"+data.kb.fri3.classCurrent[0].course.toString());
      print("time:"+data.kb.fri3.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.fri3.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.fri3.classCurrent[0].start.toString());
      print("end:"+data.kb.fri3.classCurrent[0].end.toString());
    }
    if(data.kb.fri4.kbFlag == 1){
      print("teacher:"+data.kb.fri4.classCurrent[0].teacher.toString());
      print("location:"+data.kb.fri4.classCurrent[0].location.toString());
      print("course:"+data.kb.fri4.classCurrent[0].course.toString());
      print("time:"+data.kb.fri4.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.fri4.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.fri4.classCurrent[0].start.toString());
      print("end:"+data.kb.fri4.classCurrent[0].end.toString());
    }
    if(data.kb.fri5.kbFlag == 1){
      print("teacher:"+data.kb.fri5.classCurrent[0].teacher.toString());
      print("location:"+data.kb.fri5.classCurrent[0].location.toString());
      print("course:"+data.kb.fri5.classCurrent[0].course.toString());
      print("time:"+data.kb.fri5.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.fri5.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.fri5.classCurrent[0].start.toString());
      print("end:"+data.kb.fri5.classCurrent[0].end.toString());
    }
    if(data.kb.sat1.kbFlag == 1){
      print("teacher:"+data.kb.sat1.classCurrent[0].teacher.toString());
      print("location:"+data.kb.sat1.classCurrent[0].location.toString());
      print("course:"+data.kb.sat1.classCurrent[0].course.toString());
      print("time:"+data.kb.sat1.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.sat1.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.sat1.classCurrent[0].start.toString());
      print("end:"+data.kb.sat1.classCurrent[0].end.toString());
    }
    if(data.kb.sat2.kbFlag == 1){
      print("teacher:"+data.kb.sat2.classCurrent[0].teacher.toString());
      print("location:"+data.kb.sat2.classCurrent[0].location.toString());
      print("course:"+data.kb.sat2.classCurrent[0].course.toString());
      print("time:"+data.kb.sat2.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.sat2.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.sat2.classCurrent[0].start.toString());
      print("end:"+data.kb.sat2.classCurrent[0].end.toString());
    }
    if(data.kb.sat3.kbFlag == 1){
      print("teacher:"+data.kb.sat3.classCurrent[0].teacher.toString());
      print("location:"+data.kb.sat3.classCurrent[0].location.toString());
      print("course:"+data.kb.sat3.classCurrent[0].course.toString());
      print("time:"+data.kb.sat3.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.sat3.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.sat3.classCurrent[0].start.toString());
      print("end:"+data.kb.sat3.classCurrent[0].end.toString());
    }
    if(data.kb.sat4.kbFlag == 1){
      print("teacher:"+data.kb.sat4.classCurrent[0].teacher.toString());
      print("location:"+data.kb.sat4.classCurrent[0].location.toString());
      print("course:"+data.kb.sat4.classCurrent[0].course.toString());
      print("time:"+data.kb.sat4.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.sat4.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.sat4.classCurrent[0].start.toString());
      print("end:"+data.kb.sat4.classCurrent[0].end.toString());
    }
    if(data.kb.sat5.kbFlag == 1){
      print("teacher:"+data.kb.sat5.classCurrent[0].teacher.toString());
      print("location:"+data.kb.sat5.classCurrent[0].location.toString());
      print("course:"+data.kb.sat5.classCurrent[0].course.toString());
      print("time:"+data.kb.sat5.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.sat5.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.sat5.classCurrent[0].start.toString());
      print("end:"+data.kb.sat5.classCurrent[0].end.toString());
    }
    if(data.kb.sun1.kbFlag == 1){
      print("teacher:"+data.kb.sun1.classCurrent[0].teacher.toString());
      print("location:"+data.kb.sun1.classCurrent[0].location.toString());
      print("course:"+data.kb.sun1.classCurrent[0].course.toString());
      print("time:"+data.kb.sun1.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.sun1.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.sun1.classCurrent[0].start.toString());
      print("end:"+data.kb.sun1.classCurrent[0].end.toString());
    }
    if(data.kb.sun2.kbFlag == 1){
      print("teacher:"+data.kb.sun2.classCurrent[0].teacher.toString());
      print("location:"+data.kb.sun2.classCurrent[0].location.toString());
      print("course:"+data.kb.sun2.classCurrent[0].course.toString());
      print("time:"+data.kb.sun2.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.sun2.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.sun2.classCurrent[0].start.toString());
      print("end:"+data.kb.sun2.classCurrent[0].end.toString());
    }
    if(data.kb.sun3.kbFlag == 1){
      print("teacher:"+data.kb.sun3.classCurrent[0].teacher.toString());
      print("location:"+data.kb.sun3.classCurrent[0].location.toString());
      print("course:"+data.kb.sun3.classCurrent[0].course.toString());
      print("time:"+data.kb.sun3.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.sun3.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.sun3.classCurrent[0].start.toString());
      print("end:"+data.kb.sun3.classCurrent[0].end.toString());
    }
    if(data.kb.sun4.kbFlag == 1){
      print("teacher:"+data.kb.sun4.classCurrent[0].teacher.toString());
      print("location:"+data.kb.sun4.classCurrent[0].location.toString());
      print("course:"+data.kb.sun4.classCurrent[0].course.toString());
      print("time:"+data.kb.sun4.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.sun4.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.sun4.classCurrent[0].start.toString());
      print("end:"+data.kb.sun4.classCurrent[0].end.toString());
    }
    if(data.kb.sun5.kbFlag == 1){
      print("teacher:"+data.kb.sun5.classCurrent[0].teacher.toString());
      print("location:"+data.kb.sun5.classCurrent[0].location.toString());
      print("course:"+data.kb.sun5.classCurrent[0].course.toString());
      print("time:"+data.kb.sun5.classCurrent[0].time.toString());
      print("js_xs:"+data.kb.sun5.classCurrent[0].jsXs.toString());
      print("start:"+data.kb.sun5.classCurrent[0].start.toString());
      print("end:"+data.kb.sun5.classCurrent[0].end.toString());
    }
  }else{
    print("获取信息失败");
  }
}