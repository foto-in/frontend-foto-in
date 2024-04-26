import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:foto_in/core/connection/network_info.dart';
import 'package:foto_in/core/errors/failure.dart';
import 'package:foto_in/core/token/SecureStorage.dart';
import 'package:foto_in/data/auth/datasource/remote/auth_remote_datasource.dart';
import 'package:foto_in/data/auth/model/LoginRequest.dart';
import 'package:foto_in/data/auth/model/LoginResponse.dart';
import 'package:foto_in/data/auth/repository/auth_repository.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class LoginProvider extends ChangeNotifier {
  LoginResponse? loginResponse;
  Failure? failure;

  LoginProvider({this.loginResponse, this.failure});

  void login({required LoginRequest loginRequest}) async {
    try {
      RepositoryImpl repository = RepositoryImpl(
        remoteDataSource: AuthRemoteDataSourceImpl(dio: Dio()),
        networkInfo: NetworkInfoImpl(InternetConnection()),
      );

      final result = await repository.login(loginRequest: loginRequest);

      result.fold((l) {
        failure = l;
        notifyListeners();
      }, (r) {
        loginResponse = r;
        SecureStorage().writeSecureData('token', r.data.token);
        notifyListeners();
      });
    } catch (e) {
      print('Exception: $e');

      // You can throw a custom exception or set an appropriate error state
      failure = NotFoundFailure(errorMessage: "The user cannot be made");
      notifyListeners();
    }
  }
}
