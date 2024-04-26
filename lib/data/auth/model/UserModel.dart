class UserModel {
  final String id;
  final String username;
  final String fullname;
  final dynamic profileImage;
  final dynamic localtion;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.username,
    required this.fullname,
    required this.profileImage,
    required this.localtion,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
