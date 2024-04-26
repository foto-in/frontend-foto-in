import 'package:foto_in/data/auth/model/User.dart';

class LoginDataModel {
  final User user;
  final String token;

  LoginDataModel({
    required this.user,
    required this.token,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}
