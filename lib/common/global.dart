class Global {
  static bool finger = false;
  static String host = "192.168.1.9";
  static String port = "8080";
  static String account; //我的学号
  static String account_2; //Ta的学号
  static String secret;
  static String secret_2;
  static String nickname; //姓名
  static String xueyuan;
  static String zhuanye;
  static String banji;
  static String xuenian;
  static String xueqi;
  static String week; //周次
  static String dongtai = "http://"+host+":"+port+"/admin.php?c=News&a=index";
  static String send_message =
      "http://" + host + ":"+port+"/admin.php?c=News&a=send";
  
  static String register_info = "http://" + host + ":"+port+"/admin.php";
  static String notify_url =
      "http://192.168.1.9:"+port+"/admin.php?c=Notify&a=index";
  static String kb_url = "https://xxzx.bjtuhbxy.edu.cn/login/main/ios/kb";
  static String cet_url = "https://xxzx.bjtuhbxy.edu.cn/login/main/ios/yy";
  static String cj_url = "https://xxzx.bjtuhbxy.edu.cn/login/main/ios/cj";
  static String bk_url = "https://xxzx.bjtuhbxy.edu.cn/login/main/ios/bk";
  static String news_url = "https://xxzx.bjtuhbxy.edu.cn/wxApplets/spaces/home";
  static String avator_img_url = "";
  static String app_url = "https://www.hbxy.xyz/";
  static String protrol_url = "https://www.hbxy.xyz/jwxt/tiaoKuan.html";
  static String calendar_url;
  static String get_week = "https://xxzx.bjtuhbxy.edu.cn/wxApplets/spaces/week";
  
}
