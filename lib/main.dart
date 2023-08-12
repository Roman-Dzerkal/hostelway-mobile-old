import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostelway/helpers/configs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final GoRouter router = configAppRouting();

  logger.i('Welcome to Hostelway!');

  runApp(MaterialApp.router(
    debugShowCheckedModeBanner: false,
    title: 'HostelWay',
    routerConfig: router,
  ));
}
