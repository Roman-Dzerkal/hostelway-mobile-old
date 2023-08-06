import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelway/helpers/typography.dart';
import 'package:hostelway/pages/auth/registration/registration_vm.dart';
import 'package:stacked/stacked.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegistrationViewModel>.reactive(
      viewModelBuilder: () => RegistrationViewModel(),
      builder: (context, model, child) => SafeArea(
          child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome!', style: headlineLarge),
            TextFormField(
              controller: model.emailController,
              decoration: InputDecoration(
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(CupertinoIcons.envelope),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            TextFormField(
              controller: model.passwordController,
              decoration: InputDecoration(
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(CupertinoIcons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            Form(
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
                    border: OutlineInputBorder(
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
            TextButton(
                onPressed: () {
                  if (model.confirmPasswordValidatorKey.currentState!
                      .validate()) {}
                },
                child: const Text('Sign up'))
          ],
        ),
      )),
    );
  }
}
