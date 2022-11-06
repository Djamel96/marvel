import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:marvelphazero/characters/models/character_provider.dart';
import 'package:marvelphazero/characters/models/result_api.dart';
import 'package:marvelphazero/helpers/constants.dart';
import 'package:marvelphazero/http/api.dart';
import 'package:marvelphazero/http/dio_requests.dart';
import 'package:marvelphazero/http/generic_response.dart';

Future<GenericResponse> getCharactersList(CharacterProvider characterProvider,
    {required bool refresh}) async {
  Response? response;
  if (refresh) {
    characterProvider.loading = true;
    characterProvider.errorOccured = false;
  } else {
    characterProvider.laodingMore = true;
  }
  characterProvider.notify();

  Map<String, dynamic>? parameters = {
    'apikey': apikey,
    'hash': hash,
    'ts': ts,
    'limit': 10,
    'offset': refresh ? 0 : characterProvider.resultApi.offset,
  };

  await dioget(
    url: Api.characters,
    parameters: parameters,
  ).then((onValue) {
    response = onValue;
  });

  if (response?.statusCode == 200) {
    log(response!.data.toString());
    ResultApi resultApi = ResultApi.fromJson(response!.data['data']);
    if (refresh) {
      // First enter to screen
      characterProvider.resultApi = resultApi;
      characterProvider.resultApi.offset = characterProvider.resultApi.count;
      characterProvider.loading = false;
    } else {
      // Load more when schrolling
      characterProvider.resultApi = ResultApi(
        count: resultApi.count,
        limit: resultApi.limit,
        offset: characterProvider.resultApi.results.length + resultApi.count,
        results: characterProvider.resultApi.results + resultApi.results,
        total: resultApi.total,
      );
      characterProvider.laodingMore = false;
    }
    characterProvider.notify();
    return GenericResponse.defaultSuccess();
  } else {
    characterProvider.errorOccured = true;
    characterProvider.notify();
  }
  return GenericResponse.defaultError();
}
