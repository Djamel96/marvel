import 'package:flutter/foundation.dart';
import 'package:marvelphazero/characters/models/result_api.dart';

class CharacterProvider with ChangeNotifier {
  bool loading = true;
  bool laodingMore = true;
  bool errorOccured = false;
  late ResultApi resultApi;

  notify() {
    notifyListeners();
  }
}
