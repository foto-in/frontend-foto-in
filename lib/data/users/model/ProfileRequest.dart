import 'dart:convert';

class ProfileRequest {
  final String username;
  final String fullname;
  final String profileImage;

  ProfileRequest({
    required this.username,
    required this.fullname,
    required this.profileImage,
  });

  factory ProfileRequest.fromRawJson(String str) =>
      ProfileRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileRequest.fromJson(Map<String, dynamic> json) => ProfileRequest(
        username: json["username"],
        fullname: json["fullname"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "fullname": fullname,
        "profile_image": profileImage,
      };
}
