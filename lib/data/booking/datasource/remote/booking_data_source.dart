// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:foto_in/core/const/constant.dart';
import 'package:foto_in/core/errors/exceptions.dart';
import 'package:foto_in/core/token/SecureStorage.dart';
import 'package:foto_in/data/booking/model/AcceptBookingRequest.dart';
import 'package:foto_in/data/booking/model/BookingRequest.dart';
import 'package:foto_in/data/booking/model/BookingResponse.dart';
import 'package:foto_in/data/booking/model/bookings_model.dart';

abstract class BookingDataSource {
  Future<BookingResponse> postBooking({required BookingRequest bookingRequest});
  Future<BookingResponse> acceptBooking(
      {required AcceptBookingRequest acceptBookingRequest});
  Future<BookingsResponse> getAllBooking();
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

    final response = await dio.post(base_url + booking_path,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
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
    try {
      final response = await dio.post(base_url + booking_path,
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
          data: bookingRequest.toJson());

      print(response);
      print(response.statusCode);

      if (response.statusCode == 200) {
        return BookingResponse.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
      throw ServerException();
    }
  }

  @override
  Future<BookingsResponse> getAllBooking() async {
    final token = await SecureStorage().readSecureData('token');

    try {
      final response = await dio.get(
        base_url + booking_path,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      print(response);

      if (response.statusCode == 200) {
        return BookingsResponse.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
      throw ServerException();
    }
  }
}
