// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:foto_in/core/const/constant.dart';
import 'package:foto_in/core/errors/exceptions.dart';
import 'package:foto_in/core/token/SecureStorage.dart';
import 'package:foto_in/data/booking/model/AcceptBookingRequest.dart';
import 'package:foto_in/data/booking/model/BookingRequest.dart';
import 'package:foto_in/data/booking/model/BookingResponse.dart';

abstract class BookingDataSource {
  Future<BookingResponse> postBooking({required BookingRequest bookingRequest});
  Future<BookingResponse> acceptBooking(
      {required AcceptBookingRequest acceptBookingRequest});
}

class BookingDataSourceImpl extends BookingDataSource {
  final Dio dio;

  BookingDataSourceImpl({required this.dio}) {
    //dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  @override
  Future<BookingResponse> acceptBooking(
      {required AcceptBookingRequest acceptBookingRequest}) async {
    final token = await SecureStorage().readSecureData('token');

    final response = await dio.post(base_url + photographer_path,
        options: Options(
          headers: {'Authorization': 'Bearer $token}'},
        ));

    print(response);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return BookingResponse.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<BookingResponse> postBooking(
      {required BookingRequest bookingRequest}) async {
    final token = await SecureStorage().readSecureData('token');

    final response = await dio.post(base_url + photographer_path,
        options: Options(
          headers: {'Authorization': 'Bearer $token}'},
        ));

    print(response);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return BookingResponse.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
