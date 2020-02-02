import 'dart:convert';
import 'package:http/http.dart' as http;
class Data {
  var week = "";
  getData() async{
      var apiUrl = "https://xxzx.bjtuhbxy.edu.cn/get_week";
      var result = await http.get(apiUrl);
      if(result.statusCode == 200 ){
        print(result.body);
        if(json.decode(result.body)["flag"] == 1){
          week =  "第"+json.decode(result.body)["interval"].toString()+"周";
        }else{
          week = "当前非教学周";
        }
      }
    }
}