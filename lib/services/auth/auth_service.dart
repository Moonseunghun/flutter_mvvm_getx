import 'dart:convert';
import 'package:anychat_demo/model/user/user.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<UserModel> login(String username, String password) async {
    const String url = "https://example.com/api/login";

    final response = await _dio.post(
      url,
      data: {'username': username, 'password': password},
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception("Failed to login");
    }
  }
}
