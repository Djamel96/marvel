import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:marvelphazero/characters/models/character_provider.dart';
import 'package:marvelphazero/characters/models/result_api.dart';
import 'package:marvelphazero/http/api.dart';
import 'package:marvelphazero/http/dio_requests.dart';
import 'package:marvelphazero/http/generic_response.dart';

Future<GenericResponse> getCharactersList(CharacterProvider characterProvider,
    {bool refresh = true}) async {
  Response? response;

  if (refresh) {
    characterProvider.loading = true;
    characterProvider.errorOccured = false;
  }

  await dioget(
    url: Api.characters,
  ).then((onValue) {
    response = onValue;
  });

  if (response?.statusCode == 200) {
    log(response!.data.toString());
    ResultApi resultApi = ResultApi.fromJson(response!.data);
    if (refresh) {
      // First enter to screen
      characterProvider.resultApi = resultApi;
      characterProvider.loading = false;
    } else {
      // Load more when schrolling
      characterProvider.resultApi = ResultApi(
        count: resultApi.count,
        limit: resultApi.limit,
        offset: resultApi.offset,
        results: characterProvider.resultApi.results + resultApi.results,
        total: resultApi.total,
      );
    }
    characterProvider.notify();
    return GenericResponse.defaultSuccess();
  }

  return GenericResponse.defaultError();
}
