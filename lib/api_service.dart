import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hostelway/helpers/configs.dart';
import 'package:hostelway/models/user_model.dart';

import 'helpers/constants.dart';

Dio _dio = Dio();

void login(String email, String password) {
  FormData formData = FormData(camelCaseContentDisposition: false);
  formData.fields.add(const MapEntry('key', 'value'));
  _dio.postUri(Uri.https(server, '/login'), data: formData);
}



Future<UserModel?> signUp(String email, String password, String role,
    String name, String phoneNumber) async {
  FormData registrationData = FormData();
  registrationData.fields.addAll([
    MapEntry('email', email),
    MapEntry('password', password),
    MapEntry('name', name),
    MapEntry('role', role),
    MapEntry('phone_number', phoneNumber)
  ]);
  Response<String> response = await _dio
      .postUri(Uri.https(server, 'registration'), data: registrationData);


  Map<String, dynamic> mapData =
      jsonDecode(response.data!) as Map<String, dynamic>;

  if (mapData['message'] != successRegistrationMessage) {
    logger.e(mapData['server'], error: mapData['message']);
    return null;
  }

  logger.i(mapData['message']);

  return UserModel.fromJson(mapData);
}
