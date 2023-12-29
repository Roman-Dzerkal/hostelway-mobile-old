// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostelway/api_service.dart';
import 'package:hostelway/helpers/configs.dart';
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
    return emailController.text.isEmpty ||
        nameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        phoneNumberController.text.isEmpty;
  }

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void passwordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void confirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  Future<void> sendRequest(BuildContext context) async {
    if (validate()) {
      logger.e('Fill up all fields');
    }
    bool isSignedUp = await signUp(
        emailController.text,
        passwordController.text,
        roles[selectedRoleIndex],
        nameController.text,
        phoneNumberController.text);
    if (isSignedUp) {
      GoRouter.of(context).go('/login');
    }
  }
}
