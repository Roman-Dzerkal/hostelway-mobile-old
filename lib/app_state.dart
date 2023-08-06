import 'package:hostelway/models/user_model.dart';

class AppState {
  AppState._privateConstructor();
  static final AppState _instance = AppState._privateConstructor();
  static AppState get instance => _instance;

  UserModel? user;
}
