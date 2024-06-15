import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:foto_in/core/connection/network_info.dart';
import 'package:foto_in/core/errors/failure.dart';
import 'package:foto_in/data/photographer/datasource/remote/photographer_data_source.dart';
import 'package:foto_in/data/photographer/model/PhotographerModel.dart';
import 'package:foto_in/data/photographer/repository/photographer_repository.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class HomeProvider extends ChangeNotifier {
  List<PhotographerModel> photographerList = [];
  List<PhotographerModel> photographerListWedding = [];
  List<PhotographerModel> photographerListWisuda = [];
  Failure? failure;

  final PhotographerRepository photographerRepository =
      PhotographerRepositoryImpl(
    photographerDataSource: PhotographerDataSourceImpl(dio: Dio()),
    networkInfo: NetworkInfoImpl(InternetConnection()),
  );

  Future<void> getAllPhotographer() async {
    try {
      final result = await photographerRepository.getAllPhotographer();
      await result.fold((l) {
        failure = l;
        notifyListeners();
      }, (r) {
        failure = null;
        photographerList = r.data;
        photographerListWedding = photographerList
            .where((element) => element.specialization.contains("Pernikahan"))
            .toList();
        photographerListWisuda = photographerList
            .where((element) => element.specialization.contains("Wisuda"))
            .toList();
        notifyListeners();
      });
    } catch (e) {
      print('Exception: $e');
      failure = NotFoundFailure(errorMessage: "The user cannot be made");
      notifyListeners();
    }
  }
}
