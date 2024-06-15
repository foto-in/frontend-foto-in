import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/connection/network_info.dart';
import 'package:foto_in/core/errors/failure.dart';
import 'package:foto_in/data/booking/datasource/remote/booking_data_source.dart';
import 'package:foto_in/data/booking/model/BookingRequest.dart';
import 'package:foto_in/data/booking/model/BookingResponse.dart';
import 'package:foto_in/data/booking/repository/booking_repository.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class BookingProvider extends ChangeNotifier {
  BookingResponse? bookingResponse;
  Failure? failure;
  final TextEditingController selectedController = TextEditingController();
  final TextEditingController tfEditingJenisAcara = TextEditingController();
  final TextEditingController tfEditingLokasiAcara = TextEditingController();
  final TextEditingController tfEditingDurasi = TextEditingController();
  final TextEditingController tfEditingWaktuMulai = TextEditingController();
  final TextEditingController tfEditingKonsep = TextEditingController();

  final BookingRepository bookingRepository = BookingRepositoryImpl(
    bookingDataSource: BookingDataSourceImpl(dio: Dio()),
    networkInfo: NetworkInfoImpl(InternetConnection()),
  );

  BookingProvider({this.bookingResponse, this.failure});

  Future<void> booking() async {
    try {
      final result = await bookingRepository.postBooking(
        bookingRequest: BookingRequest(
          photographerId: '9c49034c-5e6c-44f2-b74b-698b8bb8d5fe',
          acara: tfEditingJenisAcara.text,
          lokasi: tfEditingLokasiAcara.text,
          sesiFoto: selectedController.text,
          tanggalBooking: DateTime.now().toString(),
          durasi: int.parse(tfEditingDurasi.text),
          konsep: tfEditingKonsep.text,
          waktuMulai: tfEditingWaktuMulai.text,
          totalHarga: 1000000,
        ),
      );
      result.fold((l) {
        failure = l;
        notifyListeners();
      }, (r) {
        failure = null;
        bookingResponse = r;
        print(bookingResponse!.data);
        notifyListeners();
      });
    } catch (e) {
      print('Exception: $e');
      failure = NotFoundFailure(errorMessage: "The user cannot be made");
      notifyListeners();
    }
  }
}
