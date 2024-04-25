import 'package:dartz/dartz.dart';
import 'package:foto_in/core/connection/network_info.dart';
import 'package:foto_in/core/errors/exceptions.dart';
import 'package:foto_in/core/errors/failure.dart';
import 'package:foto_in/data/auth/datasource/remote/auth_remote_datasource.dart';
import 'package:foto_in/data/auth/model/RegisterRequest.dart';
import 'package:foto_in/data/auth/model/RegisterResponse.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterResponse>> register(
      {required RegisterRequest registerRequest});
}

class RepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, RegisterResponse>> register(
      {required RegisterRequest registerRequest}) async {
    print("test");
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
}
