// To parse this JSON data, do
//
//     final characterApi = characterApiFromJson(jsonString);

import 'dart:convert';

import 'package:marvelphazero/characters/models/character.dart';

ResultApi characterApiFromJson(String str) =>
    ResultApi.fromJson(json.decode(str));

String characterApiToJson(ResultApi data) => json.encode(data.toJson());

class ResultApi {
  ResultApi({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<Character> results;

  factory ResultApi.fromJson(Map<String, dynamic> json) => ResultApi(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: Character.listFromJson(json),
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<Character>.from(results.map((x) => x.toJson())),
      };
}
