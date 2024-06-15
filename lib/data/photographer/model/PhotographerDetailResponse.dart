import 'package:foto_in/data/photographer/model/PhotographerDetailModel.dart';

class PhotographerDetailResponse {
  final bool success;
  final String message;
  final PhotographerDetailModel data;

  PhotographerDetailResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory PhotographerDetailResponse.fromJson(Map<String, dynamic> json) =>
      PhotographerDetailResponse(
        success: json["success"],
        message: json["message"],
        data: PhotographerDetailModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}
