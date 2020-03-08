import 'package:flutter/material.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:toast/toast.dart';

class Private extends StatefulWidget {
  Private({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _PrivateState createState() => _PrivateState();
}

class _PrivateState extends State<Private> {
  @override
  Widget build(BuildContext context) {
    var localAuth = LocalAuthentication();
    auth(localAuth);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            '隐私',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Text("data")
    );
  }

  auth(localAuth) async {
    //下面是汉化
    const andStrings = const AndroidAuthMessages(
      cancelButton: '取消',
      goToSettingsButton: '去设置',
      fingerprintNotRecognized: '指纹识别失败',
      goToSettingsDescription: '请设置指纹.',
      fingerprintHint: '指纹',
      fingerprintSuccess: '指纹识别成功',
      signInTitle: '指纹验证',
      fingerprintRequiredTitle: '请先录入指纹!',
    );
    try {
      bool didAuthenticate = await localAuth.authenticateWithBiometrics(
          localizedReason: '扫描指纹进行身份识别',
          useErrorDialogs: false,
          stickyAuth: true,
          androidAuthStrings: andStrings);
      if (didAuthenticate == true) {
        Toast.show("认证成功", context);
        return Text("sdd");
      } else {
        Toast.show("认证失败", context);
      }
    } catch (e) {
      Toast.show("不能支持验证", context);
    }
  }
}
