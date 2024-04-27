import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:foto_in/core/connection/network_info.dart';
import 'package:foto_in/core/errors/failure.dart';
import 'package:foto_in/data/booking/datasource/remote/booking_data_source.dart';
import 'package:foto_in/data/booking/model/BookingRequest.dart';
import 'package:foto_in/data/booking/model/BookingResponse.dart';
import 'package:foto_in/data/booking/repository/booking_repository.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class BookingDetailProvider extends ChangeNotifier {
  BookingResponse? bookingResponse;
  Failure? failure;
  final BookingRepository bookingRepository = BookingRepositoryImpl(
      bookingDataSource: BookingDataSourceImpl(dio: Dio()),
      networkInfo: NetworkInfoImpl(InternetConnection()));

  BookingDetailProvider({this.bookingResponse, this.failure});

  void postBooking({required BookingRequest bookingRequest}) async {
    try {
      final result =
          await bookingRepository.postBooking(bookingRequest: bookingRequest);

      result.fold((l) {
        failure = l;
        notifyListeners();
      }, (r) {
        bookingResponse = r;
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
