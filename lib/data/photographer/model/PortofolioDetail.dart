class PortofolioDetail {
  final String id;
  final String photographerId;
  final String title;
  final String description;
  final List<String> urlPhoto;
  final DateTime createdAt;
  final DateTime updatedAt;

  PortofolioDetail({
    required this.id,
    required this.photographerId,
    required this.title,
    required this.description,
    required this.urlPhoto,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PortofolioDetail.fromJson(Map<String, dynamic> json) =>
      PortofolioDetail(
        id: json["id"],
        photographerId: json["photographer_id"],
        title: json["title"],
        description: json["description"],
        urlPhoto: List<String>.from(json["url_photo"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photographer_id": photographerId,
        "title": title,
        "description": description,
        "url_photo": List<dynamic>.from(urlPhoto.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
