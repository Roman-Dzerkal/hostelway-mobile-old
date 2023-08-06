import 'package:flutter/material.dart';
import 'package:hostelway/pages/auth/login/login_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HostelWay',
      home: LoginView(),
    );
  }
}
