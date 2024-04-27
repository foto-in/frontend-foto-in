class PortofolioRequest {
  final String photographerId;
  final String title;
  final String description;
  final List<String> photos;

  PortofolioRequest({
    required this.photographerId,
    required this.title,
    required this.description,
    required this.photos,
  });

  factory PortofolioRequest.fromJson(Map<String, dynamic> json) =>
      PortofolioRequest(
        photographerId: json["photographer_id"],
        title: json["title"],
        description: json["description"],
        photos: List<String>.from(json["photos"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "photographer_id": photographerId,
        "title": title,
        "description": description,
        "photos": List<dynamic>.from(photos.map((x) => x)),
      };
}
