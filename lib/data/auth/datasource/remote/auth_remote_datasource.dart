// ignore_for_file: avoid_print

import 'package:foto_in/core/const/constant.dart';
import 'package:foto_in/core/errors/exceptions.dart';
import 'package:foto_in/data/auth/model/LoginRequest.dart';
import 'package:foto_in/data/auth/model/LoginResponse.dart';
import 'package:foto_in/data/auth/model/RegisterRequest.dart';
import 'package:foto_in/data/auth/model/RegisterResponse.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponse> registerUser({
    required RegisterRequest registerRequest,
  });
  Future<LoginResponse> loginUser({
    required LoginRequest loginRequest,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio}) {
    //dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  @override
  Future<RegisterResponse> registerUser(
      {required RegisterRequest registerRequest}) async {
    final response = await dio.post(base_url + register_path, data: {
      "username": registerRequest.username,
      "fullname": registerRequest.fullname,
      "password": registerRequest.password,
    });

    print(response);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<LoginResponse> loginUser({required LoginRequest loginRequest}) async {
    final response = await dio.post(base_url + login_path, data: {
      "username": loginRequest.username,
      "password": loginRequest.password,
    });

    print(response);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
