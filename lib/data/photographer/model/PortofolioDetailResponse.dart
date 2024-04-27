import 'package:foto_in/data/photographer/model/PortofolioDetail.dart';

class PortofolioDetailResponse {
  final bool success;
  final PortofolioDetail data;

  PortofolioDetailResponse({
    required this.success,
    required this.data,
  });

  factory PortofolioDetailResponse.fromJson(Map<String, dynamic> json) =>
      PortofolioDetailResponse(
        success: json["success"],
        data: PortofolioDetail.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}
