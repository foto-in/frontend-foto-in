import 'package:foto_in/core/const/constant.dart';
import 'package:foto_in/core/errors/exceptions.dart';
import 'package:foto_in/data/model/RegisterRequest.dart';
import 'package:foto_in/data/model/RegisterResponse.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<RegisterResponse> registerUser({
    required RegisterRequest registerRequest,
  });
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio}) {
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  @override
  Future<RegisterResponse> registerUser(
      {required RegisterRequest registerRequest}) async {
    print("test");
    final response = await dio.post(base_url + register_path, data: {
      "username": registerRequest.username,
      "fullname": registerRequest.fullname,
      "password": registerRequest.password,
    });

    print(response);
    print(response.statusCode);
    print("Urlnya bang:" + base_url + register_path);

    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
