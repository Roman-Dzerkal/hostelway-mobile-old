import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostelway/api_service.dart';
import 'package:hostelway/models/user_model.dart';
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

  void sendRequest(BuildContext buildContext) async {
    UserModel ? user = await login(emailController.text, passwordController.text);
    if(user != null ){
       GoRouter.of(buildContext).go('/profile');
    }
    /*var headers = {'Content-Type': 'application/json'};
    var data =
        json.encode({"email": "www@gmail.com", "hashed_password": "123"});
    var dio = Dio(BaseOptions(followRedirects: true));
    var response = await dio.request(
      'http://192.168.56.1:8000/signin',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
    } else {}*/
  }
}
