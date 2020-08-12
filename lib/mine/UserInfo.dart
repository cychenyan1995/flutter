import 'package:flutterdemo/mine/row.dart';
import 'package:flutterdemo/mine/header.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/webview/browser.dart';
import 'package:provider/provider.dart';
import 'package:flutterdemo/model/demo.dart';

// 我的
class UserInfo extends StatelessWidget {
  final decoration = new BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
            color: Colors.black12,
            // offset: Offset(15.0, 15.0), //阴影xy轴偏移量
            blurRadius: 15.0, //阴影模糊程度
            spreadRadius: 1.0 //阴影扩散程度
            )
      ]);
  @override
  Widget build(BuildContext context) {
    // 获取状态管理器中的数据
    final count = Provider.of<MyModel>(context).count;
    // card
    Widget cardF = new Container(
      margin: EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 10),
      // padding: EdgeInsets.all(5),
      decoration: decoration,
      child: new Column(
        children: <Widget>[
          new RowType(
            icon: Icons.view_comfy,
            title: '昵称$count',
            subtitle: '库管小灵通0636966',
            nextIcon: Icon(Icons.keyboard_arrow_right),
            onPress: () {
              Provider.of<MyModel>(context).setCount();
              // Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
              //   return new Browser(
              //     url: "https://flutter-io.cn/",
              //     title: "Flutter 中文社区",
              //   );
              // })
              // );
            },
          ),
          new RowType(
              icon: Icons.vpn_key,
              title: '修改密码',
              subtitle: '',
              nextIcon: Icon(Icons.keyboard_arrow_right)),
          // new Divider()
        ],
      ),
    );
    Widget cardS = new Container(
      margin: EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 10),
      decoration: decoration,
      child: new Column(
        children: <Widget>[
          new RowType(
              icon: Icons.local_post_office,
              title: '版本号',
              subtitle: 'V1.0.23',
              nextIcon: Icon(null)),
          new RowType(
              icon: Icons.stay_current_portrait,
              title: '清空缓存',
              subtitle: '',
              nextIcon: Icon(Icons.keyboard_arrow_right)),
        ],
      ),
    );
    Widget cardT = new Container(
      margin: EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 10),
      decoration: decoration,
      child: new Column(
        children: <Widget>[
          new RowType(
              icon: Icons.error_outline,
              title: '关于APP',
              subtitle: '',
              nextIcon: Icon(Icons.keyboard_arrow_right)),
          new RowType(
              icon: Icons.star,
              title: '推荐给好友',
              subtitle: '',
              nextIcon: Icon(Icons.keyboard_arrow_right)),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: new Text(
          '我的',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.tealAccent[700],
      ),
      body: new ListView(
        children: <Widget>[new Header(), cardF, cardS, cardT],
      ),
    );
  }
}
