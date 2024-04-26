import 'package:foto_in/data/photographer/model/PortofolioDetail.dart';

class PortofolioListResponse {
  final bool success;
  final List<PortofolioDetail> data;

  PortofolioListResponse({
    required this.success,
    required this.data,
  });

  factory PortofolioListResponse.fromJson(Map<String, dynamic> json) =>
      PortofolioListResponse(
        success: json["success"],
        data: List<PortofolioDetail>.from(
            json["data"].map((x) => PortofolioDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
