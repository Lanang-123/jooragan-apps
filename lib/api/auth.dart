import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

class AuthController {
  final dio = Dio();
  final baseUrl = "https://api.jooragan.id/api/";

  Future<dynamic> register(String name, String email, String password) async {
    Response response = await dio.post(
      '$baseUrl' + 'register',
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          "Accept": "application/json",
        },
      ),
    );

    print(response.data); // Tambahkan baris ini untuk melihat respons
    print(response.statusCode);

    if (response.statusCode == 201) {
      return response.data;
    } else {
      print(response.data);
    }
  }

  Future<dynamic> login(String email, String password) async {
    Response response = await dio.post(
      '$baseUrl' + 'login',
      data: {
        'email': email,
        'password': password,
      },
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          "Accept": "application/json",
        },
      ),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to login');
    }
  }
}
