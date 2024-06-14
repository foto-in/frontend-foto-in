import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:foto_in/core/connection/network_info.dart';
import 'package:foto_in/core/errors/failure.dart';
import 'package:foto_in/data/users/datasource/users_data_source.dart';
import 'package:foto_in/data/users/model/ProfileRequest.dart';
import 'package:foto_in/data/users/model/ProfileResponse.dart';
import 'package:foto_in/data/users/repository/profile_repository.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

enum ProfileRole { client, photographer }

class ProfileProvider extends ChangeNotifier {
  ProfileRepository profileRepository = ProfileRepositoryImpl(
    usersDataSource: UserDataSourceImpl(dio: Dio()),
    networkInfo: NetworkInfoImpl(InternetConnection()),
  );

  Failure? failure;

  ProfileResponse? profileResponse;

  ProfileProvider();

  ProfileRole profileRole = ProfileRole.client;

  Future<void> getProfile() async {
    try {
      final result = await profileRepository.getProfile();
      await result.fold((l) {
        failure = l;
        notifyListeners();
      }, (r) {
        failure = null;
        profileResponse = r;
        profileRole =
            r.role == "user" ? ProfileRole.client : ProfileRole.photographer;
        print('Role: $profileRole');
        notifyListeners();
      });
    } catch (e) {
      print('Exception: $e');
      failure = NotFoundFailure(errorMessage: "The user cannot be made");
      notifyListeners();
    }
  }

  Future<void> updateProfile(ProfileRequest profileRequest) async {
    try {
      final result =
          await profileRepository.updateProfile(profileRequest: profileRequest);
      await result.fold((l) {
        failure = l;
        notifyListeners();
      }, (r) {
        failure = null;
        profileResponse = r;
        notifyListeners();
      });
    } catch (e) {
      print('Exception: $e');
      failure = NotFoundFailure(errorMessage: "The user cannot be made");
      notifyListeners();
    }
  }
}
