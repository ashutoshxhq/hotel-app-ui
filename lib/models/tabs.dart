import 'package:flutter/material.dart';

class Tabs with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndex(i) async{
    _currentIndex = i;
    notifyListeners();
  }
}
