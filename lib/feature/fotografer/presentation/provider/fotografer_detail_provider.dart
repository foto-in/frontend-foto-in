import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/connection/network_info.dart';
import 'package:foto_in/core/errors/failure.dart';
import 'package:foto_in/data/photographer/datasource/remote/photographer_data_source.dart';
import 'package:foto_in/data/photographer/model/PhotographerDetailModel.dart';
import 'package:foto_in/data/photographer/repository/photographer_repository.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class FotograferDetailProvider extends ChangeNotifier {
  final PhotographerRepository photographerRepository =
      PhotographerRepositoryImpl(
    photographerDataSource: PhotographerDataSourceImpl(dio: Dio()),
    networkInfo: NetworkInfoImpl(InternetConnection()),
  );

  PhotographerDetailModel? photographerDetailModel;
  Failure? failure;

  Future<void> getFotograferDetail(String photographerId) async {
    try {
      final result = await photographerRepository.getPhotographer(
        photographerId: photographerId,
      );

      result.fold((l) {
        failure = l;
        notifyListeners();
      }, (r) {
        failure = null;
        photographerDetailModel = r.data;
        notifyListeners();
      });
    } catch (e) {
      print('Exception: $e');
      failure = NotFoundFailure(errorMessage: "The user cannot be made");
      notifyListeners();
    }
  }
}
