import 'package:flutter/material.dart';
import 'package:hostelway/pages/auth/login/login_vm.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onViewModelReady: (viewModel) {},
      builder: (context, model, child) => Scaffold(),
    );
  }
}
