import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Browser extends StatelessWidget {
  const Browser({Key key, this.url, this.title}) : super(key: key);

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(title),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}