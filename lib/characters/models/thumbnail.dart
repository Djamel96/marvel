class Thumbnail {
  Thumbnail({
    required this.path,
    required this.extension,
  });

  final String path;
  final String extension;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
      };
}
