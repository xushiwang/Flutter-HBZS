import 'package:shared_preferences/shared_preferences.dart';
class Global {
  static SharedPreferences _prefs;
  static String account;
  static String secret; 
  static String nickname;
  @override
  Future<void> initState() async { 
    _prefs = await SharedPreferences.getInstance();
  }
  void setNickname(a){
    nickname = a;
    
  }
  getNickname(){
    return nickname;
  }


  void setAccount(String a){
    account = _prefs.setString("account", a) as String;
  }
  getAccount(){
    account = _prefs.getString("account");
    return account;
  }


  void setSecret(String s){
    secret = _prefs.setString("secret",s) as String;
  }
  getSecret(){
    secret = _prefs.getString("secret");
    return secret;
  }
}