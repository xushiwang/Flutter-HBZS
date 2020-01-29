import 'dart:convert';
import 'package:http/http.dart' as http;
class Data {
  var WEEK = "";
  getData() async{
      var apiUrl = "https://xxzx.bjtuhbxy.edu.cn/get_week";
      var result = await http.get(apiUrl);
      if(result.statusCode == 200 ){
        print(result.body);
        if(json.decode(result.body)["flag"] == 1){
          WEEK =  "第"+json.decode(result.body)["interval"].toString()+"周";
        }else{
          WEEK = "当前非教学周";
        }
      }
    }
}