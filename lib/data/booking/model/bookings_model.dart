import 'package:foto_in/data/booking/model/BookingModel.dart';

class BookingsResponse {
  final String message;
  final List<BookingModel> data;

  BookingsResponse({
    required this.message,
    required this.data,
  });

  factory BookingsResponse.fromJson(Map<String, dynamic> json) =>
      BookingsResponse(
        message: json["message"],
        data: List<BookingModel>.from(
            json["data"].map((x) => BookingModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
