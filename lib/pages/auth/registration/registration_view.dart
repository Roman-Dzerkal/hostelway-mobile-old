// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hostelway/helpers/custom_color.dart';
import 'package:hostelway/helpers/typography.dart';
import 'package:hostelway/pages/auth/registration/registration_vm.dart';
import 'package:stacked/stacked.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:go_router/go_router.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<RegistrationViewModel>.reactive(
      viewModelBuilder: () => RegistrationViewModel(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(model.unfocusNode),
          child: Scaffold(
            backgroundColor: const Color(0xfffbfbfb),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Sign Up', style: headlineLarge),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: model.shadows),
                    child: TextFormField(
                      controller: model.nameController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter your first and last name',
                          prefixIcon: const Icon(CupertinoIcons.person),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: model.shadows),
                    child: TextFormField(
                      controller: model.emailController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter your email',
                          prefixIcon: const Icon(CupertinoIcons.envelope),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: model.shadows,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      controller: model.passwordController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter your password',
                          prefixIcon: const Icon(CupertinoIcons.lock),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: model.shadows,
                        borderRadius: BorderRadius.circular(15)),
                    child: Form(
                      key: model.confirmPasswordValidatorKey,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password canot be empty';
                          }
                          return null;
                        },
                        controller: model.confirmPasswordController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'Confirm password',
                            prefixIcon: const Icon(CupertinoIcons.lock),
                            errorBorder: OutlineInputBorder(
                                gapPadding: 50,
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ))),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: model.shadows,
                        borderRadius: BorderRadius.circular(15)),
                    child: Form(
                      child: TextFormField(
                        controller: model.phoneNumberController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '+380',
                            prefixIcon: const Icon(CupertinoIcons.phone_fill),
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    minWidth: 90.0,
                    cornerRadius: 20.0,
                    activeBgColors: [
                      [CustomColors.primaryColor],
                      [CustomColors.secondaryColor]
                    ],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.white,
                    inactiveFgColor: Colors.black,
                    borderColor: const [Colors.black],
                    borderWidth: 0.5,
                    initialLabelIndex: 1,
                    totalSwitches: 2,
                    fontSize: 16,
                    labels: model.roles,
                    radiusStyle: true,
                    onToggle: (index) {
                      model.selectedRoleIndex = index!;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            await model.sendRequest(context);
                          },
                          child: Container(
                            height: size.height * 0.05,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(colors: [
                                  CustomColors.primaryColor,
                                  CustomColors.secondaryColor
                                ])),
                            child: const Center(
                                child: Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  RichText(
                      softWrap: true,
                      text: TextSpan(children: [
                        const TextSpan(
                            text: 'Do you have already an account?  ',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                          style: TextStyle(color: CustomColors.primaryColor),
                          text: 'Log in',
                          mouseCursor: SystemMouseCursors.click,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              GoRouter.of(context).go('/login');
                              debugPrint('Я хачу питсы');
                            },
                        )
                      ]))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
