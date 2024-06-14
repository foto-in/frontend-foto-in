import 'package:dartz/dartz.dart';
import 'package:foto_in/core/connection/network_info.dart';
import 'package:foto_in/core/errors/exceptions.dart';
import 'package:foto_in/core/errors/failure.dart';
import 'package:foto_in/data/users/datasource/users_data_source.dart';
import 'package:foto_in/data/users/model/ProfileRequest.dart';
import 'package:foto_in/data/users/model/ProfileResponse.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileResponse>> getProfile();
  Future<Either<Failure, ProfileResponse>> updateProfile(
      {required ProfileRequest profileRequest});
}

class ProfileRepositoryImpl implements ProfileRepository {
  final UsersDataSource usersDataSource;
  final NetworkInfo networkInfo;

  ProfileRepositoryImpl(
      {required this.usersDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, ProfileResponse>> getProfile() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteGetProfile = await usersDataSource.getProfile();
        return Right(remoteGetProfile);
      } on ServerException {
        return Left(ServerFailure(errorMessage: "Server Error"));
      }
    } else {
      return Left(ServerFailure(errorMessage: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, ProfileResponse>> updateProfile(
      {required ProfileRequest profileRequest}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUpdateProfile =
            await usersDataSource.updateProfile(profileRequest: profileRequest);
        return Right(remoteUpdateProfile);
      } on ServerException {
        return Left(ServerFailure(errorMessage: "Server Error"));
      }
    } else {
      return Left(ServerFailure(errorMessage: "No Internet Connection"));
    }
  }
}
