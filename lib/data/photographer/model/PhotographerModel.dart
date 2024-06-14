import 'package:foto_in/data/photographer/model/PortofolioDetail.dart';
import 'package:foto_in/data/users/model/ProfileDetail.dart';

class PhotographerModel {
  final String id;
  final String userId;
  final String email;
  final String noHp;
  final String noTelegram;
  final String type;
  final List<String> specialization;
  final List<String> camera;
  final int startPrice;
  final int endPrice;
  final String name;
  final String? profileImage;
  final List<PortofolioDetail> portofolios;
  final ProfileDetail user;

  PhotographerModel({
    required this.id,
    required this.userId,
    required this.email,
    required this.noHp,
    required this.noTelegram,
    required this.type,
    required this.specialization,
    required this.camera,
    required this.startPrice,
    required this.endPrice,
    required this.name,
    required this.profileImage,
    required this.portofolios,
    required this.user,
  });

  factory PhotographerModel.fromJson(Map<String, dynamic> json) =>
      PhotographerModel(
        id: json["id"],
        userId: json["user_id"],
        email: json["email"],
        noHp: json["no_hp"],
        noTelegram: json["no_telegram"],
        type: json["type"],
        specialization: List<String>.from(json["specialization"].map((x) => x)),
        camera: List<String>.from(json["camera"].map((x) => x)),
        startPrice: json["start_price"],
        endPrice: json["end_price"],
        name: json["name"],
        profileImage: json["profile_image"],
        portofolios:
            List<PortofolioDetail>.from(json["portofolios"].map((x) => x)),
        user: ProfileDetail.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "email": email,
        "no_hp": noHp,
        "no_telegram": noTelegram,
        "type": type,
        "specialization": List<dynamic>.from(specialization.map((x) => x)),
        "camera": List<dynamic>.from(camera.map((x) => x)),
        "start_price": startPrice,
        "end_price": endPrice,
        "name": name,
        "profile_image": profileImage,
        "portofolios": List<dynamic>.from(portofolios.map((x) => x)),
        "user": user.toJson(),
      };
}
