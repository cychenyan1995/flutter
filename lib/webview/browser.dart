import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Browser extends StatelessWidget{
  const  Browser({Key key, this.url, this.title}) : super(key: key);
  final String url;
  final String title;
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}