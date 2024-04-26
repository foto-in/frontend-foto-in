import 'package:dartz/dartz.dart';
import 'package:foto_in/core/connection/network_info.dart';
import 'package:foto_in/core/errors/exceptions.dart';
import 'package:foto_in/core/errors/failure.dart';
import 'package:foto_in/data/auth/datasource/remote/auth_remote_datasource.dart';
import 'package:foto_in/data/auth/model/LoginRequest.dart';
import 'package:foto_in/data/auth/model/LoginResponse.dart';
import 'package:foto_in/data/auth/model/RegisterRequest.dart';
import 'package:foto_in/data/auth/model/RegisterResponse.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterResponse>> register(
      {required RegisterRequest registerRequest});
  Future<Either<Failure, LoginResponse>> login(
      {required LoginRequest loginRequest});
}

class RepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, RegisterResponse>> register(
      {required RegisterRequest registerRequest}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteRegister = await remoteDataSource.registerUser(
            registerRequest: registerRequest);
        return Right(remoteRegister);
      } on ServerException {
        return Left(ServerFailure(errorMessage: "Server Error"));
      }
    } else {
      return Left(ServerFailure(errorMessage: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> login(
      {required LoginRequest loginRequest}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteLogin =
            await remoteDataSource.loginUser(loginRequest: loginRequest);
        return Right(remoteLogin);
      } on ServerException {
        return Left(ServerFailure(errorMessage: "Server Error"));
      }
    } else {
      return Left(ServerFailure(errorMessage: "No Internet Connection"));
    }
  }
}
