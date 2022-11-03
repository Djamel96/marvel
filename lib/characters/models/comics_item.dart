class ComicsItem {
  ComicsItem({
    required this.resourceUri,
    required this.name,
  });

  final String resourceUri;
  final String name;

  factory ComicsItem.fromJson(Map<String, dynamic> json) => ComicsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}
