import 'package:dartz/dartz.dart';
import 'package:foto_in/core/connection/network_info.dart';
import 'package:foto_in/core/errors/exceptions.dart';
import 'package:foto_in/core/errors/failure.dart';
import 'package:foto_in/data/photographer/datasource/remote/photographer_data_source.dart';
import 'package:foto_in/data/photographer/model/PhotographerListResponse.dart';
import 'package:foto_in/data/photographer/model/PhotographerRequest.dart';
import 'package:foto_in/data/photographer/model/PhotographerResponse.dart';
import 'package:foto_in/data/photographer/model/PortofolioDetailResponse.dart';
import 'package:foto_in/data/photographer/model/PortofolioListResponse.dart';
import 'package:foto_in/data/photographer/model/PortofolioRequest.dart';
import 'package:foto_in/data/photographer/model/PortofolioResponse.dart';

abstract class PhotographerRepository {
  Future<Either<Failure, PhotographerResponse>> registerPhotographer(
      {required PhotographerRequest photographerRequest});
  Future<Either<Failure, PortofolioResponse>> postPortofolio(
      {required PortofolioRequest portofolioRequest});
  Future<Either<Failure, PortofolioListResponse>> getAllPortofolio(
      {required String photographerId});
  Future<Either<Failure, PortofolioDetailResponse>> getDetailPortofolio(
      {required String photographerId, required String portofolioId});
  Future<Either<Failure, PhotographerListResponse>> getAllPhotographer();
}

class PhotographerRepositoryImpl implements PhotographerRepository {
  final PhotographerDataSource photographerDataSource;
  final NetworkInfo networkInfo;

  PhotographerRepositoryImpl(
      {required this.photographerDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, PhotographerResponse>> registerPhotographer(
      {required PhotographerRequest photographerRequest}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteRegister = await photographerDataSource
            .registerPhotographer(photographerRequest: photographerRequest);
        return Right(remoteRegister);
      } on ServerException {
        return Left(ServerFailure(errorMessage: "Server Error"));
      }
    } else {
      return Left(ServerFailure(errorMessage: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, PortofolioResponse>> postPortofolio(
      {required PortofolioRequest portofolioRequest}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remotePostPortofolio = await photographerDataSource
            .postPortofolio(portofolioRequest: portofolioRequest);
        return Right(remotePostPortofolio);
      } on ServerException {
        return Left(ServerFailure(errorMessage: "Server Error"));
      }
    } else {
      return Left(ServerFailure(errorMessage: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, PortofolioListResponse>> getAllPortofolio(
      {required String photographerId}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteGetAllPortofolio = await photographerDataSource
            .getAllPortofolio(photographerId: photographerId);
        return Right(remoteGetAllPortofolio);
      } on ServerException {
        return Left(ServerFailure(errorMessage: "Server Error"));
      }
    } else {
      return Left(ServerFailure(errorMessage: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, PortofolioDetailResponse>> getDetailPortofolio(
      {required String photographerId, required String portofolioId}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteGetDetailPortofolio =
            await photographerDataSource.getDetailPortofolio(
                photographerId: photographerId, portofolioId: portofolioId);
        return Right(remoteGetDetailPortofolio);
      } on ServerException {
        return Left(ServerFailure(errorMessage: "Server Error"));
      }
    } else {
      return Left(ServerFailure(errorMessage: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, PhotographerListResponse>> getAllPhotographer() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteAllPhotographer =
            await photographerDataSource.getAllPhotographer();
        return Right(remoteAllPhotographer);
      } on ServerException {
        return Left(ServerFailure(errorMessage: "Server Error"));
      }
    } else {
      return Left(ServerFailure(errorMessage: "No Internet Connection"));
    }
  }
}
