import 'enum_values.dart';

class StoriesItem {
  StoriesItem({
    required this.resourceUri,
    required this.name,
    this.type,
  });

  final String resourceUri;
  final String name;
  final Type? type;

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: typeValues.map[json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": typeValues.reverse[type],
      };
}
