import 'package:flutter/material.dart';
import 'package:hostelway/models/user_model.dart';
import 'package:stacked/stacked.dart';
import 'package:hostelway/api_service.dart';
import 'package:go_router/go_router.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  bool obscurePassword = true;

  final RegExp emailRegex = RegExp('source');

  void unhidePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }


  void sendRequest(BuildContext buildContext) async{
    UserModel ? user = await login(emailController.text, passwordController.text);
    if(user != null ){
       GoRouter.of(buildContext).go('/profile');
    }

  }
}
