import 'dart:convert';

class ProfileDetail {
  final String id;
  final String username;
  final String fullname;
  final String? profileImage;
  final dynamic localtion;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProfileDetail({
    required this.id,
    required this.username,
    required this.fullname,
    required this.profileImage,
    required this.localtion,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProfileDetail.fromRawJson(String str) =>
      ProfileDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileDetail.fromJson(Map<String, dynamic> json) => ProfileDetail(
        id: json["id"],
        username: json["username"],
        fullname: json["fullname"],
        profileImage: json["profile_image"],
        localtion: json["localtion"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "fullname": fullname,
        "profile_image": profileImage,
        "localtion": localtion,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
