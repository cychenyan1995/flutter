import 'package:flutter/material.dart';
import 'package:flutterdemo/webview/browser.dart';
import 'package:flutter/cupertino.dart';
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
        child: CupertinoButton(
          padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
          color: Colors.blue,
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
              return new Browser(
                url: "https://flutter-io.cn/",
                title: "Flutter 中文社区",
              );
            }));
          },
          child: Text(
            '打开网页',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
