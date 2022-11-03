import 'comics_item.dart';

class Comics {
  Comics({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  final int available;
  final String collectionUri;
  final List<ComicsItem> items;
  final int returned;

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<ComicsItem>.from(
            json["items"].map((x) => ComicsItem.fromJson(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
      };
}
