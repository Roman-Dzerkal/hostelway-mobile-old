import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  bool obscurePassword = true;

  final RegExp emailRegex = RegExp('source');

  void unhidePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }
}
