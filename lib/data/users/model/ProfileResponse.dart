import 'dart:convert';

import 'package:foto_in/data/users/model/ProfileDetail.dart';

class ProfileResponse {
  final String message;
  final ProfileDetail data;
  final String role;

  ProfileResponse({
    required this.message,
    required this.data,
    required this.role,
  });

  factory ProfileResponse.fromRawJson(String str) =>
      ProfileResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        message: json["message"],
        data: ProfileDetail.fromJson(json["data"]),
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
        "role": role,
      };
}
