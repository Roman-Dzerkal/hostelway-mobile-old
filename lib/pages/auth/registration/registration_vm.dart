import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RegistrationViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> confirmPasswordValidatorKey =
      GlobalKey<FormState>();

  void validate() {
    
  }
}
