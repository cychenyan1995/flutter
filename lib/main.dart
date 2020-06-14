import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/webview/browser.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:flutterdemo/mine/row.dart';
import 'package:flutterdemo/mine/header.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(primaryColor: Colors.blue),
      home: new UserInfo(),
    );
  }
}

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primaryColor: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

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
    // card
    Widget cardF = new Container(
      margin: EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 10),
      // padding: EdgeInsets.all(5),
      decoration: decoration,
      child: new Column(
        children: <Widget>[
          new RowType(
            icon: Icons.star,
            title: '昵称',
            subtitle: '库管小灵通0636966',
            nextIcon: Icon(Icons.keyboard_arrow_right),
            onPress: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                return new Browser(
                  url: "https://flutter-io.cn/",
                  title: "Flutter 中文社区",
                );
              }));
            },
          ),
          new RowType(
              icon: Icons.star,
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
              icon: Icons.star,
              title: '版本号',
              subtitle: 'V1.0.23',
              nextIcon: Icon(null)),
          new RowType(
              icon: Icons.star,
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
              icon: Icons.star,
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
        title: Text('我的'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[new Header(), cardF, cardS, cardT],
      ),
    );
  }
}

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

// 列表demo
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; // _私有变量
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();
  Widget _buildSuggestions() {
    // 函数
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        // 如果是建议列表中最后一个单词对
        if (index >= _suggestions.length) {
          // ...接着再生成10个单词对，然后添加到建议列表
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ), // 添加icon
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      }, // 点击就事件
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("Saved Suggestions"),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}

// 行
class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = new Container(
        child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildButtonColumn(Icons.call, 'CALL'),
        buildButtonColumn(Icons.near_me, 'ROUTE'),
        buildButtonColumn(Icons.share, 'SHARE'),
      ],
    ));
    return new Scaffold(
        appBar: AppBar(title: Text('首页')),
        body: new ListView(children: [titleSection, buttonSection])
        //...,
        );
  }
}

//webview
class WebViewDemo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('webview')),
      body: Center(
        child: FlatButton(
            child: Text('open page'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyWebView(
                  title: 'curr page',
                  selectedUrl: 'https://flutterchina.club/',
                ),
              ));
            }),
      ),
    );
  }
}

class MyWebView extends StatelessWidget {
  final String title;
  final String selectedUrl;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  MyWebView({
    @required this.title,
    @required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: WebView(
          initialUrl: selectedUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}
