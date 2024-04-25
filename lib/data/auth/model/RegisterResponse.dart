import 'package:foto_in/data/auth/model/RegisterDataModel.dart';

class RegisterResponse {
  final bool success;
  final String message;
  final RegisterDataModel data;

  RegisterResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        success: json["success"],
        message: json["message"],
        data: RegisterDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}
