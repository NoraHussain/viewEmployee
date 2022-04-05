import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_breaking/constants/strings.dart';

class EmployeesWebServices {

  late Dio dio;

  EmployeesWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        HttpHeaders.authorizationHeader: 'token 905e667eab02207:7bc458ce0fa819e',
      },
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000, //20 seconds
    );
    dio = Dio(options);
  }

  Future <List<dynamic>> getAllEmployee() async {
    try {
      Response response = await dio.get('https://restaurant.partner-cons.com/api/resource/Employee',);
      print(response.data['data']);
      return response.data['data'];
    }
    catch (e) {
     print("i am here" + e.toString());
      return [];
    }
  }
}

