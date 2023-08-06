import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelway/helpers/typography.dart';
import 'package:hostelway/pages/auth/login/login_vm.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Don't remove this object. It needed to adaptive layout
    final Size screenSize = MediaQuery.of(context).size;
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onViewModelReady: (viewModel) {},
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email', style: lableLarge),
                      Form(
                        child: TextFormField(
                          validator: (value) {},
                          controller: model.emailController,
                          maxLines: 1,
                          decoration: InputDecoration(
                              hintText: 'Enter your email',
                              prefixIcon: const Icon(CupertinoIcons.envelope),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Password', style: lableLarge),
                      Form(
                        child: TextFormField(
                          validator: (value) {},
                          controller: model.passwordController,
                          maxLines: 1,
                          obscureText: model.obscurePassword,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                              hintText: 'Enter your password',
                              prefixIcon: const Icon(CupertinoIcons.lock),
                              suffixIcon: IconButton(
                                onPressed: model.unhidePassword,
                                icon: Icon(model.obscurePassword
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.blueAccent)),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
