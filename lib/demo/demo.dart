import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/mine/MyHomePage.dart';

void main() {
  runApp(new MaterialApp(
    title: 'demo',
    theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: new Demo(),
  ));
}

class Demo extends StatefulWidget {
  final String text;
  Demo({Key key, this.text = "widgetful demo"}) : super(key: key);

  @override
  _State createState() => new _State();
}

class _State extends State<Demo> {
  final GlobalKey _formKey = new GlobalKey(); // 定义全局key值

  bool isShow = false;
  String titleText = "widgetful Text";
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _formKey, // 设置key值
      appBar: new AppBar(
        title: new Text(widget.text), // Demo类的传参widget.text
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          FlatButton(
            child: Text('router Demo'),
            textColor: Colors.blue,
            onPressed: () {
              final formKey = _formKey.currentState; // 获取state对象
              print(formKey);
              setState(() {
                titleText = 'widgetful demo changed'; // 重新绘制不同的地方
              });
              Navigator.push(
                  context, CupertinoPageRoute(builder: (ctx) => MyHomePage()));
              var _result =
                  Navigator.pushNamed(context, '/homePage'); // 通过路由命名来跳转
              print('$_result'); // 关闭页面返回的参数
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ), // 间隔  MediaQuery获取屏幕信息
          Text(titleText), // state中定义的参数
        ],
      )),
    );
  }
}
