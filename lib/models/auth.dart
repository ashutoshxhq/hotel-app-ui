import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  bool _state = false;
  String _token;
  String get token => _token;
  bool get state => _state;
  void changeToken(t) async{
    _token = t;
    notifyListeners();
  }
  void login() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', _token);
    _state = true;
    print('Login');
    notifyListeners();
  }

  void logout() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    _state = false;
    print('Logout');
    notifyListeners();
  }
}
