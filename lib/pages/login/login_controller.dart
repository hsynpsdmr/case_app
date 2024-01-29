import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  String? token;

  void setToken(String? token) {
    this.token = token;
    notifyListeners();
  }
}
