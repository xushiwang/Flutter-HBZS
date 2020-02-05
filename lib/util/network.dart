import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Response> Network(FormData params,String url) async {
    //print(params);
    Dio dio = new Dio();
    try {
      Response response = await dio
          .post("https://xxzx.bjtuhbxy.edu.cn/login/main/get_yy", data: params);
      return response;
    } on DioError catch (e) {
      // 请求错误处理
      print("Dio网络错误:"+e.toString());
      return null;
    }
  }