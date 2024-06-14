import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:foto_in/core/connection/network_info.dart';
import 'package:foto_in/core/errors/failure.dart';
import 'package:foto_in/data/auth/datasource/remote/auth_remote_datasource.dart';
import 'package:foto_in/data/auth/repository/auth_repository.dart';
import 'package:foto_in/data/photographer/datasource/remote/photographer_data_source.dart';
import 'package:foto_in/data/photographer/model/PhotographerRequest.dart';
import 'package:foto_in/data/photographer/model/PhotographerResponse.dart';
import 'package:foto_in/data/photographer/repository/photographer_repository.dart';
import 'package:foto_in/data/users/datasource/users_data_source.dart';
import 'package:foto_in/data/users/model/ProfileResponse.dart';
import 'package:foto_in/data/users/repository/profile_repository.dart';
import 'package:foto_in/feature/auth/provider/auth_provider.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:provider/provider.dart';

class RegisterPhotographerProvider extends ChangeNotifier {
  PhotographerResponse? registerPhotographerResponse;
  ProfileResponse? profileResponse;
  Failure? failure;
  final TextEditingController namaLengkap = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController noTelp = TextEditingController();
  final TextEditingController noTelegram = TextEditingController();
  String? type;
  List<String> specialization = [];
  List<TextEditingController> camera = [TextEditingController()];
  final TextEditingController startPrice = TextEditingController();
  final TextEditingController endPrice = TextEditingController();

  final PhotographerRepository photographerRepository =
      PhotographerRepositoryImpl(
          photographerDataSource: PhotographerDataSourceImpl(dio: Dio()),
          networkInfo: NetworkInfoImpl(InternetConnection()));

  final ProfileRepository profileRepository = ProfileRepositoryImpl(
    usersDataSource: UserDataSourceImpl(dio: Dio()),
    networkInfo: NetworkInfoImpl(InternetConnection()),
  );

  RegisterPhotographerProvider(
      {this.registerPhotographerResponse, this.failure});

  Future<void> getProfile() async {
    try {
      final result = await profileRepository.getProfile();
      await result.fold((l) {
        failure = l;
        notifyListeners();
      }, (r) {
        failure = null;
        profileResponse = r;
        namaLengkap.text = profileResponse!.data.fullname;
        username.text = profileResponse!.data.username;
        notifyListeners();
      });
    } catch (e) {
      print('Exception: $e');
      failure = NotFoundFailure(errorMessage: "The user cannot be made");
      notifyListeners();
    }
  }

  Future<void> registerPhotographer() async {
    try {
      PhotographerRequest photographerRequest = PhotographerRequest(
          fullname: namaLengkap.text,
          username: username.text,
          email: email.text,
          noHp: noTelp.text,
          noTelegram: noTelegram.text,
          type: type ?? '',
          specialization: specialization,
          camera: camera.map((e) => e.text).toList(),
          startPrice: int.parse(startPrice.text),
          endPrice: int.parse(endPrice.text));

      print(photographerRequest.toJson());

      final result = await photographerRepository.registerPhotographer(
          photographerRequest: photographerRequest);

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
