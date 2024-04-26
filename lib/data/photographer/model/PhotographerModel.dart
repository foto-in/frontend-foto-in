class PhotographerModel {
  final String userId;
  final String email;
  final String noHp;
  final String noTelegram;
  final String type;
  final List<String> specialization;
  final List<String> camera;
  final int startPrice;
  final int endPrice;
  final String id;

  PhotographerModel({
    required this.userId,
    required this.email,
    required this.noHp,
    required this.noTelegram,
    required this.type,
    required this.specialization,
    required this.camera,
    required this.startPrice,
    required this.endPrice,
    required this.id,
  });

  factory PhotographerModel.fromJson(Map<String, dynamic> json) =>
      PhotographerModel(
        userId: json["user_id"],
        email: json["email"],
        noHp: json["no_hp"],
        noTelegram: json["no_telegram"],
        type: json["type"],
        specialization: List<String>.from(json["specialization"].map((x) => x)),
        camera: List<String>.from(json["camera"].map((x) => x)),
        startPrice: json["start_price"],
        endPrice: json["end_price"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "email": email,
        "no_hp": noHp,
        "no_telegram": noTelegram,
        "type": type,
        "specialization": List<dynamic>.from(specialization.map((x) => x)),
        "camera": List<dynamic>.from(camera.map((x) => x)),
        "start_price": startPrice,
        "end_price": endPrice,
        "id": id,
      };
}
