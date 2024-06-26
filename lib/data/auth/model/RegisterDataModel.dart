// ignore_for_file: file_names

class RegisterDataModel {
  final String username;
  final String fullname;
  final String id;
  final String token;
  final DateTime updatedAt;
  final DateTime createdAt;

  RegisterDataModel({
    required this.username,
    required this.fullname,
    required this.id,
    required this.token,
    required this.updatedAt,
    required this.createdAt,
  });

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      RegisterDataModel(
        username: json["username"],
        fullname: json["fullname"],
        id: json["id"],
        token: json["token"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "fullname": fullname,
        "id": id,
        "token": token,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
      };
}
