import 'package:dio/dio.dart';
import 'package:foto_in/core/const/constant.dart';
import 'package:foto_in/core/errors/exceptions.dart';
import 'package:foto_in/core/token/SecureStorage.dart';
import 'package:foto_in/data/users/model/ProfileRequest.dart';
import 'package:foto_in/data/users/model/ProfileResponse.dart';

abstract class UsersDataSource {
  Future<ProfileResponse> getProfile();
  Future<ProfileResponse> updateProfile(
      {required ProfileRequest profileRequest});
}

class UserDataSourceImpl implements UsersDataSource {
  final Dio dio;

  UserDataSourceImpl({required this.dio}) {
    //dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  @override
  Future<ProfileResponse> getProfile() async {
    final token = await SecureStorage().readSecureData("token");
    final response = await dio.get(
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        base_url + user_path);

    print("HTTP Response: $response");
    print(response.statusCode);

    if (response.statusCode == 200) {
      return ProfileResponse.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProfileResponse> updateProfile(
      {required ProfileRequest profileRequest}) async {
    final token = await SecureStorage().readSecureData("token");
    final response = await dio.put(base_url + user_path,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        data: {
          "username": profileRequest.username,
          "fullname": profileRequest.fullname,
          "profile_image": profileRequest.profileImage,
        });

    print(response);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return ProfileResponse.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
