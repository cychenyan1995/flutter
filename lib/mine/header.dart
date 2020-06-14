import 'package:flutter/material.dart';

class Header extends StatelessWidget{
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
  Widget build(BuildContext context){
    return new Container(
      margin: EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: decoration,
      child: new Row(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(right: 10),
            decoration: new BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: new Icon(
              Icons.person,
              size: 40,
              color: Colors.green,
            ),
          ),
          new Expanded(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                new Text(
                  '库管小灵通0636966',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text('用户名：wms123456555',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        )),
                    new Text('手机：1382123456',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold))
                  ],
                )
              ])),
        ],
      ),
    );
  }
}