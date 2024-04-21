import 'dart:io';
import 'dart:convert';

import 'package:flutter_spotify_ui/core/generate.dart';
import 'package:flutter_spotify_ui/models/element_class.dart';

void save({required List<CustomElement> packs}) {
  File file = File('save.json');

  final data = getJsonFromPacks(packs);
  file.writeAsStringSync(json.encode(data));
}
