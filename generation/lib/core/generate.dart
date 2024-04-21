import 'package:flutter_spotify_ui/models/element_class.dart';

List<String> getVariantsFromPacks(List<CustomElement> packs) {
  List<String> _words = [];

  recursPaks({required String stroka, required index}) {
    if (packs.length > index) {
      for (final word in packs[index].words) {
        final nextWord = stroka + ' ' + word;
        recursPaks(stroka: nextWord, index: index + 1);
      }
    } else {
      if (!_words.contains(stroka)) {
        _words.add(stroka);
      }
    }
  }

  recursPaks(stroka: '', index: 0);
  return _words;
}

Map<String, String> getJsonFromPacks(List<CustomElement> packs) {
  Map<String, String> result = {};

  for (final pack in packs) {
    result.addAll({pack.toString(): pack.words.join(',').toString()});
  }
  return result;
}
