import 'package:flutter/material.dart';
import 'package:flutterdemo/mine/UserInfo.dart';
import 'package:provider/provider.dart';
import 'package:flutterdemo/model/demo.dart';
import 'package:flutterdemo/mine/MyHomePage.dart';
import 'package:flutterdemo/login/login.dart';

import 'demo/demo.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => myModel,
        )
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      initialRoute: '/', // 初始路由
      theme: new ThemeData(primaryColor: Colors.blue),
      routes: <String, WidgetBuilder>{
        // 命名路由
        "/homePage": (context) => MyHomePage(),
        '/demo': (context) => Demo(),
        "/": (context) => Login()
      },
      // home: new Demo(),
    );
  }
}
