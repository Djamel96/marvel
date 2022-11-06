import 'package:marvelphazero/characters/models/thumbnail.dart';
import 'package:marvelphazero/characters/models/url_custom.dart';

class ComicData {
  ComicData({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  int offset;
  final int limit;
  final int total;
  final int count;
  final List<Result> results;

  factory ComicData.fromJson(Map<String, dynamic> json) => ComicData(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  Result({
    required this.id,
    required this.title,
    required this.urls,
    required this.thumbnail,
  });

  final int id;
  final String title;
  final List<CustomUrl> urls;
  final Thumbnail thumbnail;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        urls: List<CustomUrl>.from(
            json["urls"].map((x) => CustomUrl.fromJson(x))),
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
      );
}
