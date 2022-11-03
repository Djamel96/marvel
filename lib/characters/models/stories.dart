import 'package:marvelphazero/characters/models/stories_item.dart';

class Stories {
  Stories({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  final int available;
  final String collectionUri;
  final List<StoriesItem> items;
  final int returned;

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<StoriesItem>.from(
            json["items"].map((x) => StoriesItem.fromJson(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
      };
}
