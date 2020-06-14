import 'package:flutter/material.dart';
import 'package:flutterdemo/webview/browser.dart';

class RowType extends StatelessWidget {
  const RowType({Key key, this.title, this.subtitle, this.icon, this.nextIcon,this.onPress})
      : super(key: key);
  final title;
  final subtitle;
  final icon;
  final nextIcon; // 右边跳转按钮
  final onPress; // 按钮点击方法
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: new Container(
          padding: const EdgeInsets.only(bottom: 10.0, top: 10),
          decoration: new BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey[200], width: 1))),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Row(children: [
                new Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: new Icon(
                    icon,
                    size: 20,
                    color: Colors.green,
                  ),
                ),
                new Container(
                  child: new Text(
                    title,
                    style: new TextStyle(fontSize: 16),
                  ),
                ),
              ]),
              new Row(
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: new Text(
                      subtitle,
                      style: new TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  new IconButton(
                    icon: nextIcon,
                    color: Colors.grey,
                    onPressed: onPress
                  )
                ],
              )
            ],
          ),
        ));
  }
}
