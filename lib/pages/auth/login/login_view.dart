import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelway/helpers/typography.dart';
import 'package:hostelway/pages/auth/login/login_vm.dart';
import 'package:stacked/stacked.dart';
import 'package:hostelway/api_service.dart';
import 'package:go_router/go_router.dart';
import 'package:hostelway/helpers/custom_color.dart';
import 'package:hostelway/helpers/typography.dart';


class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Don't remove this object. It needed to adaptive layout
    // final Size screenSize = MediaQuery.of(context).size;
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
                  Text('Login', style: headlineLarge),
                  SizedBox(height: 40),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: model.emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xfffbfbfb),
                          hintText: 'Your email',
                          prefixIcon: const Icon(CupertinoIcons.envelope),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                    decoration: BoxDecoration(
                    
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
                  SizedBox(height: 40),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            GoRouter.of(context).go('/profile');
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
                              'Login',
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
