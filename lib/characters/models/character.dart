import 'dart:developer';

import 'package:marvelphazero/characters/models/stories.dart';
import 'package:marvelphazero/characters/models/thumbnail.dart';
import 'comics.dart';
import 'url_custom.dart';

class Character {
  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceUri,
    required this.comics,
    required this.series,
    required this.stories,
    required this.events,
    required this.urls,
  });

  final int id;
  final String name;
  final String description;
  final String modified;
  final Thumbnail thumbnail;
  final String resourceUri;
  final Comics comics;
  final Comics series;
  final Stories stories;
  final Comics events;
  final List<CustomUrl> urls;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        resourceUri: json["resourceURI"],
        comics: Comics.fromJson(json["comics"]),
        series: Comics.fromJson(json["series"]),
        stories: Stories.fromJson(json["stories"]),
        events: Comics.fromJson(json["events"]),
        urls: json["urls"] != null
            ? List<CustomUrl>.from(
                json["urls"].map((x) => CustomUrl.fromJson(x)))
            : [],
      );

  static List<Character> listFromJson(Map items, {String key = 'results'}) {
    if (items[key] == null) return [];
    List<Character> _list = [];
    for (var item in items[key]) {
      try {
        _list.add(Character.fromJson(item));
      } catch (e) {
        log(e.toString());
      }
    }
    return _list;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "thumbnail": thumbnail.toJson(),
        "resourceURI": resourceUri,
        "comics": comics.toJson(),
        "series": series.toJson(),
        "stories": stories.toJson(),
        "events": events.toJson(),
        "urls": List<CustomUrl>.from(urls.map((x) => x.toJson())),
      };
}
