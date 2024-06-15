import 'dart:convert';

import 'package:foto_in/data/photographer/model/PhotographerModel.dart';

class PhotographerListResponse {
  final bool success;
  final String message;
  final List<PhotographerModel> data;

  PhotographerListResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory PhotographerListResponse.fromRawJson(String str) =>
      PhotographerListResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PhotographerListResponse.fromJson(Map<String, dynamic> json) =>
      PhotographerListResponse(
        success: json["success"],
        message: json["message"],
        data: List<PhotographerModel>.from(
            json["data"].map((x) => PhotographerModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
