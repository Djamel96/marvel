import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:marvelphazero/characters/models/character_provider.dart';
import 'package:marvelphazero/http/api.dart';
import 'package:marvelphazero/http/dio_requests.dart';
import 'package:marvelphazero/http/generic_response.dart';

Future<GenericResponse> getCharactersList(
    CharacterProvider characterProvider) async {
  Response? response;

  await dioget(
    url: Api.characters,
  ).then((onValue) {
    response = onValue;
  });

  if (response?.statusCode == 200) {
    log(response!.data.toString());

    characterProvider.notify();
    return GenericResponse.defaultSuccess();
  }

  return GenericResponse.defaultError();
}
