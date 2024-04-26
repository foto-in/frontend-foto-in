import 'package:foto_in/data/auth/model/UserModel.dart';
import 'package:foto_in/data/photographer/model/PhotographerModel.dart';

class PhotographerResponse {
  final bool success;
  final String message;
  final PhotographerModel data;
  final UserModel user;

  PhotographerResponse({
    required this.success,
    required this.message,
    required this.data,
    required this.user,
  });

  factory PhotographerResponse.fromJson(Map<String, dynamic> json) =>
      PhotographerResponse(
        success: json["success"],
        message: json["message"],
        data: PhotographerModel.fromJson(json["data"]),
        user: UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
        "user": user.toJson(),
      };
}
