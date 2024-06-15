// ignore_for_file: file_names

import 'package:foto_in/data/auth/model/LoginDataModel.dart';

class LoginResponse {
  final bool success;
  final String message;
  final LoginDataModel data;

  LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        message: json["message"],
        data: LoginDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}
