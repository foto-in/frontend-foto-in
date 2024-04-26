import 'package:foto_in/data/auth/model/UserModel.dart';

class LoginDataModel {
  final UserModel user;
  final String token;

  LoginDataModel({
    required this.user,
    required this.token,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
        user: UserModel.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}
