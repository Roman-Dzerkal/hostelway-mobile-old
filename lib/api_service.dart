import 'package:dio/dio.dart';

import 'helpers/constants.dart';

Dio _dio = Dio(BaseOptions(baseUrl: server));

void login(String email, String password) {
  FormData formData = FormData(camelCaseContentDisposition: false);
  formData.fields.add(const MapEntry('key', 'value'));
  _dio.postUri(Uri.https(server, '/login'), data: formData);
}
