import 'package:foto_in/data/photographer/model/PortofolioDetail.dart';

class PortofolioResponse {
  final bool success;
  final String message;
  final PortofolioDetail data;

  PortofolioResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory PortofolioResponse.fromJson(Map<String, dynamic> json) =>
      PortofolioResponse(
        success: json["success"],
        message: json["message"],
        data: PortofolioDetail.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}
