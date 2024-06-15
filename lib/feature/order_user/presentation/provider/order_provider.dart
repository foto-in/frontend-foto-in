import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/connection/network_info.dart';
import 'package:foto_in/core/errors/failure.dart';
import 'package:foto_in/data/booking/datasource/remote/booking_data_source.dart';
import 'package:foto_in/data/booking/model/BookingModel.dart';
import 'package:foto_in/data/booking/repository/booking_repository.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class OrderProvider extends ChangeNotifier {
  List<BookingModel> orderList = [];
  List<BookingModel> orderListWaiting = [];
  List<BookingModel> orderListAccepted = [];
  List<BookingModel> orderListDone = [];
  Failure? failure;

  final BookingRepository bookingRepositor = BookingRepositoryImpl(
    bookingDataSource: BookingDataSourceImpl(
      dio: Dio(),
    ),
    networkInfo: NetworkInfoImpl(InternetConnection()),
  );

  Future<void> getAllOrder() async {
    try {
      final result = await bookingRepositor.getAllBooking();
      print(result);
      result.fold((l) {
        failure = l;
        notifyListeners();
      }, (r) {
        failure = null;
        orderList = r.data;
        orderListWaiting =
            orderList.where((element) => element.status == 'waiting').toList();
        orderListAccepted =
            orderList.where((element) => element.status == 'accepted').toList();
        orderListDone =
            orderList.where((element) => element.status == 'done').toList();
        notifyListeners();
      });
    } catch (e) {
      print('Exception: $e');
      failure = NotFoundFailure(errorMessage: "The user cannot be made");
      notifyListeners();
    }
  }
}
