import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:foto_in/core/connection/network_info.dart';
import 'package:foto_in/core/errors/failure.dart';
import 'package:foto_in/data/photographer/datasource/remote/photographer_data_source.dart';
import 'package:foto_in/data/photographer/model/PhotographerRequest.dart';
import 'package:foto_in/data/photographer/model/PhotographerResponse.dart';
import 'package:foto_in/data/photographer/repository/photographer_repository.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class RegisterPhotographerProvider extends ChangeNotifier {
  PhotographerResponse? registerPhotographerResponse;
  Failure? failure;
  String? status;

  final PhotographerRepository photographerRepository =
      PhotographerRepositoryImpl(
          photographerDataSource: PhotographerDataSourceImpl(dio: Dio()),
          networkInfo: NetworkInfoImpl(InternetConnection()));

  RegisterPhotographerProvider(
      {this.registerPhotographerResponse, this.failure});

  void registerPhotographer(
      {required PhotographerRequest registerPhotographerRequest}) async {
    try {
      final result = await photographerRepository.registerPhotographer(
          photographerRequest: registerPhotographerRequest);

      result.fold((l) {
        failure = l;
        notifyListeners();
      }, (r) {
        registerPhotographerResponse = r;
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
