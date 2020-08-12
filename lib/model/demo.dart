import 'package:flutter/material.dart';

// with  mixin混入ChangeNotifier
class MyModel with ChangeNotifier {
  int _count = 0;
  int get count => _count; // get方法

  // 修改
  void setCount() {
    _count++;
    notifyListeners(); // 通知使用_count得地方自动更新
  }
}

final myModel = MyModel();
