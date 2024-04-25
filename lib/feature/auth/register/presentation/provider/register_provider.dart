import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/connection/network_info.dart';
import 'package:foto_in/core/errors/failure.dart';
import 'package:foto_in/data/auth/datasource/remote/auth_remote_datasource.dart';
import 'package:foto_in/data/auth/model/RegisterRequest.dart';
import 'package:foto_in/data/auth/model/RegisterResponse.dart';
import 'package:foto_in/data/auth/repository/auth_repository.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class RegisterProvider extends ChangeNotifier {
  RegisterResponse? registerResponse;
  Failure? failure;

  RegisterProvider({this.registerResponse, this.failure});

  void register({required RegisterRequest registerRequest}) async {
    try {
      print("test");
      RepositoryImpl repository = RepositoryImpl(
        remoteDataSource: AuthRemoteDataSourceImpl(dio: Dio()),
        networkInfo: NetworkInfoImpl(InternetConnection()),
      );

      final result =
          await repository.register(registerRequest: registerRequest);

      result.fold((l) {
        failure = l;
        notifyListeners();
      }, (r) {
        registerResponse = r;
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
