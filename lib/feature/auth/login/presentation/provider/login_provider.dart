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

  bool isLoginVar = false;

  LoginProvider({this.loginResponse, this.failure});

  Future<void> login({required LoginRequest loginRequest}) async {
    try {
      RepositoryImpl repository = RepositoryImpl(
        remoteDataSource: AuthRemoteDataSourceImpl(dio: Dio()),
        networkInfo: NetworkInfoImpl(InternetConnection()),
      );

      final result = await repository.login(loginRequest: loginRequest);

      await result.fold((l) {
        loginResponse = null;
        failure = l;
        notifyListeners();
      }, (r) async {
        failure = null;
        loginResponse = r;
        print('Token: ${r.data.token}');
        await SecureStorage().writeSecureData('token', r.data.token);
        notifyListeners();
      });
    } catch (e) {
      print('Exception: $e');

      // You can throw a custom exception or set an appropriate error state
      failure = NotFoundFailure(errorMessage: "The user cannot be made");
      // throw failure!;
      notifyListeners();
    }
  }

  // Future<bool> isLogin() async {
  //   isLoginVar = false;
  //   notifyListeners();
  //   String token = await SecureStorage().readSecureData('token');
  //   if (token != 'No data found!') {
  //     isLoginVar = true;
  //     notifyListeners();
  //     return true;
  //   } else {
  //     isLoginVar = false;
  //     notifyListeners();
  //     return false;
  //   }
  // }
}
