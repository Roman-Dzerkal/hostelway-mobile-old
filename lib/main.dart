import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostelway/helpers/configs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final GoRouter router = configAppRouting();

  logger.i('Welcome to Hostelway!');

  BotToastInit(); // Инициализация BotToast версии 3.x.x

  runApp(MaterialApp.router(
    debugShowCheckedModeBanner: false,
    title: 'HostelWay',
    routerConfig: router,
  ));
}



