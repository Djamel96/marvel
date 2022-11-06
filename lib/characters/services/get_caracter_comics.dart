import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:marvelphazero/characters/models/character.dart';
import 'package:marvelphazero/characters/models/comic_data.dart';
import 'package:marvelphazero/helpers/constants.dart';
import 'package:marvelphazero/http/api.dart';
import 'package:marvelphazero/http/dio_requests.dart';
import 'package:marvelphazero/http/generic_response.dart';

Future<GenericResponse> getCharacterComicList({
  required int offset,
  required Character character,
}) async {
  Response? response;
  Map<String, dynamic>? parameters = {
    'apikey': apikey,
    'hash': hash,
    'ts': ts,
    'limit': 10,
    'offset': offset,
  };
  await dioget(
    url: Api.characterComicsList
        .replaceFirst('characterId', character.id.toString()),
    parameters: parameters,
  ).then((onValue) {
    response = onValue;
  });

  if (response?.statusCode == 200) {
    log(response!.data.toString());
    ComicData resultApi = ComicData.fromJson(response!.data['data']);
    return GenericResponse.defaultSuccess(value: resultApi);
  }
  return GenericResponse.defaultError();
}
