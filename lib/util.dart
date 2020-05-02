import 'dart:math';

import 'package:flutter/services.dart';

class Util {
  static String getRandomEmojiFromList(List<String> list) {
    var rng = new Random();
    return list[rng.nextInt(list.length)];
  }

  static Future<String> readFileAsync(String filePath) async {
    return await rootBundle.loadString(filePath);
  }
}
