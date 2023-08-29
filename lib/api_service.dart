import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hostelway/helpers/configs.dart';
import 'package:hostelway/models/user_model.dart';
import 'helpers/constants.dart';


Dio _dio = Dio();

Future<UserModel?> login(String email, String password) async{
  var data = Map.from({"email": email, "hashed_password":password});
  _dio.options.headers['Content-Type'] = 'application/json';
  Response<String> response = await _dio.request('http://127.0.0.1:8000/signin',options: Options(method: 'POST',),
  data: data,
);
  

  if (response.data != null){
    Map<String, dynamic> mapData = jsonDecode(response.data!) as Map<String, dynamic>;
    return UserModel.fromJson(mapData);
  }
  return null;


}

Future<bool> signUp(String email, String password, String role, String name,
    String phoneNumber) async {
  FormData registrationData = FormData();
  registrationData.fields.addAll([
    MapEntry('email', email),
    MapEntry('hashed_password', password),
    MapEntry('name', name),
    MapEntry('role', role),
    MapEntry('phone_number', phoneNumber)
  ]);

  Response<String> response = await _dio
      .postUri(Uri.https(server, 'signup'), data: registrationData);

  Map<String, dynamic> mapData =
      jsonDecode(response.data!) as Map<String, dynamic>;

  if (mapData['message'] != successRegistrationMessage) {
    logger.e(mapData['server'], error: mapData['message']);
    return false;
  }

  logger.i(mapData['message']);
  return true;
}



