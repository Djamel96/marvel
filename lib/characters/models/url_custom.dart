class CustomUrl {
  CustomUrl({
    required this.type,
    required this.url,
  });

  final String type;
  final String url;

  factory CustomUrl.fromJson(Map<String, dynamic> json) => CustomUrl(
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
      };
}
