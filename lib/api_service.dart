import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:hostelway/helpers/configs.dart';
import 'package:hostelway/models/user_model.dart';
import 'helpers/constants.dart';


Dio _dio = Dio();

Future<UserModel?> login(String email, String password) async{
  var data = Map.from({"email": email, "hashed_password":password});
  _dio.options.headers['Content-Type'] = 'application/json';
  Response<String> response = await _dio.request('http://192.168.172.210:8000/signin/',options: Options(method: 'POST',), data: data);
  

  if (response.data != null){
    Map<String, dynamic> mapData = jsonDecode(response.data!) as Map<String, dynamic>;
    return UserModel.fromJson(mapData);
  }
  return null;


}


Future<bool> signUp(String email, String password, String role, String name, String phoneNumber) async {
   
  var data = Map.from({"email": email, "hashed_password": password, "role": role, "name": name, "phone": phoneNumber});
  
  _dio.options.headers['Content-Type'] = 'application/json';
  Response<String> response = await _dio.request('http://192.168.172.210:8000/signup/', options: Options(method: 'POST',), data: data);
  
  
  if (response.statusCode == 200) {
      // Регистрация успешна
      return true;
    } else {
     
      return false;
    }

}



