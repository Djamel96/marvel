import 'package:flutter/foundation.dart';
import 'package:marvelphazero/characters/models/result_api.dart';

class CharacterProvider with ChangeNotifier {
  /// [loading] a variable that will allow us to show the loading
  /// widget when we fatch data from Marvel api

  bool loading = true;

  /// [laodingMore] a variable that will allow us to show the loading
  /// widget when we fatch more data from Marvel api when the user
  /// scrolle to the bottom of the screen

  bool laodingMore = false;

  /// [errorOccured] a variable that will allow us to show the error
  /// screen when the data fetching was failed

  bool errorOccured = false;

  /// [resultApi] result object of marvel api call
  late ResultApi resultApi;

  notify() {
    notifyListeners();
  }
}
