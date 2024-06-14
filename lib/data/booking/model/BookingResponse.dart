// ignore_for_file: file_names

import 'package:foto_in/data/booking/model/BookingModel.dart';

class BookingResponse {
  final String message;
  final BookingModel data;

  BookingResponse({
    required this.message,
    required this.data,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      BookingResponse(
        message: json["message"],
        data: BookingModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}
