class PhotographerRequest {
  final String userId;
  final String username;
  final String fullname;
  final String email;
  final String noHp;
  final String noTelegram;
  final String type;
  final List<String> specialization;
  final List<String> camera;
  final int startPrice;
  final int endPrice;

  PhotographerRequest({
    required this.userId,
    required this.username,
    required this.fullname,
    required this.email,
    required this.noHp,
    required this.noTelegram,
    required this.type,
    required this.specialization,
    required this.camera,
    required this.startPrice,
    required this.endPrice,
  });

  factory PhotographerRequest.fromJson(Map<String, dynamic> json) =>
      PhotographerRequest(
        userId: json["user_id"],
        username: json["username"],
        fullname: json["fullname"],
        email: json["email"],
        noHp: json["no_hp"],
        noTelegram: json["no_telegram"],
        type: json["type"],
        specialization: List<String>.from(json["specialization"].map((x) => x)),
        camera: List<String>.from(json["camera"].map((x) => x)),
        startPrice: json["start_price"],
        endPrice: json["end_price"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "fullname": fullname,
        "email": email,
        "no_hp": noHp,
        "no_telegram": noTelegram,
        "type": type,
        "specialization": List<dynamic>.from(specialization.map((x) => x)),
        "camera": List<dynamic>.from(camera.map((x) => x)),
        "start_price": startPrice,
        "end_price": endPrice,
      };
}
