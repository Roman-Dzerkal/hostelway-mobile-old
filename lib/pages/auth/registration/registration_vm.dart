import 'package:flutter/material.dart';
import 'package:hostelway/api_service.dart';
import 'package:hostelway/models/user_model.dart';
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

  final FocusNode unfocusNode = FocusNode();

  bool validate() {
    return emailController.text.isNotEmpty ||
        nameController.text.isNotEmpty ||
        passwordController.text.isNotEmpty ||
        confirmPasswordController.text.isNotEmpty ||
        phoneNumberController.text.isNotEmpty;
  }

  Future<UserModel?> sendRequest(BuildContext context) async {
    if (!validate()) {
      throw Exception('Fill up all fields');
    }

    final user = await signUp(
        emailController.text,
        passwordController.text,
        roles[selectedRoleIndex],
        nameController.text,
        phoneNumberController.text);
    return user;
  }
}
