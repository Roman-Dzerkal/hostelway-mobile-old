import 'package:flutter/material.dart';
import 'package:hostelway/api_service.dart';
import 'package:hostelway/app_state.dart';
import 'package:stacked/stacked.dart';

class RegistrationViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController(),
      nameController = TextEditingController(),
      phoneNumberController = TextEditingController(),
      confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> confirmPasswordValidatorKey =
      GlobalKey<FormState>();

  List<String> roles = const ['Guest', 'Manager'];
  int selectedRoleIndex = 1;

  final shadows = const [
    BoxShadow(
      blurRadius: 15,
      color: Color(0x33000000),
      offset: Offset(0, 0),
      spreadRadius: 5,
    )
  ];

  void validate() {}

  Future<void> sendRequest(BuildContext context) async {
    final user = await signUp(
        emailController.text,
        passwordController.text,
        roles[selectedRoleIndex],
        nameController.text,
        phoneNumberController.text);
    Navigator.of(context).pushNamed('/login');
  }
}
