import 'package:dartz/dartz.dart';
import 'package:foto_in/core/connection/network_info.dart';
import 'package:foto_in/core/errors/exceptions.dart';
import 'package:foto_in/core/errors/failure.dart';
import 'package:foto_in/data/booking/datasource/remote/booking_data_source.dart';
import 'package:foto_in/data/booking/model/AcceptBookingRequest.dart';
import 'package:foto_in/data/booking/model/BookingRequest.dart';
import 'package:foto_in/data/booking/model/BookingResponse.dart';
import 'package:foto_in/data/booking/model/bookings_model.dart';

abstract class BookingRepository {
  Future<Either<Failure, BookingResponse>> postBooking(
      {required BookingRequest bookingRequest});
  Future<Either<Failure, BookingResponse>> acceptBooking(
      {required AcceptBookingRequest acceptBookingRequest});
  Future<Either<Failure, BookingsResponse>> getAllBooking();
}

class BookingRepositoryImpl implements BookingRepository {
  final BookingDataSource bookingDataSource;
  final NetworkInfo networkInfo;

  BookingRepositoryImpl(
      {required this.bookingDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, BookingResponse>> acceptBooking(
      {required AcceptBookingRequest acceptBookingRequest}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteAcceptBooking = await bookingDataSource.acceptBooking(
            acceptBookingRequest: acceptBookingRequest);
        return Right(remoteAcceptBooking);
      } on ServerException {
        return Left(ServerFailure(errorMessage: "Server Error"));
      }
    } else {
      return Left(ServerFailure(errorMessage: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, BookingResponse>> postBooking(
      {required BookingRequest bookingRequest}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remotePostBooking =
            await bookingDataSource.postBooking(bookingRequest: bookingRequest);
        return Right(remotePostBooking);
      } on ServerException {
        return Left(ServerFailure(errorMessage: "Server Error"));
      }
    } else {
      return Left(ServerFailure(errorMessage: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, BookingsResponse>> getAllBooking() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteGetAllBooking = await bookingDataSource.getAllBooking();
        return Right(remoteGetAllBooking);
      } on ServerException {
        return Left(ServerFailure(errorMessage: "Server Error"));
      }
    } else {
      return Left(ServerFailure(errorMessage: "No Internet Connection"));
    }
  }
}
