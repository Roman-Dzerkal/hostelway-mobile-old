import 'package:firebase_core/firebase_core.dart';

class AppState {
  AppState._privateConstructor();
  static final AppState _instance = AppState._privateConstructor();
  static AppState get instance => _instance;

  late FirebaseApp firebaseApp;
}
