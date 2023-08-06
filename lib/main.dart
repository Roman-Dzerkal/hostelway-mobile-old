import 'package:flutter/material.dart';
import 'package:hostelway/pages/auth/login/login_view.dart';
import 'package:hostelway/pages/auth/registration/registration_view.dart';

bool goLogin = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HostelWay',
      home: goLogin ? const LoginView() : const RegistrationView(),
    );
  }
}
