import 'dart:convert';

import 'package:talkmoji/converter.dart';
import 'package:talkmoji/util.dart';

import 'conversions.dart';

class ConversionFactory {
  static Converter converter;

  static init() async {
    var string = await Util.readFileAsync("assets/conversions.json");
    var data = json.decode(string);
    final mappings = data["mapping"];
    List<Conversion> conversions = [];
    for (var key in mappings.keys) {
      print(key + ": " + mappings[key].toString());

      if (mappings[key] is String) {
        conversions.add(new SingleConversion(key, mappings[key]));
      } else if (mappings[key] is List) {
        conversions.add(new MultipleConversion(key, List<String>.from(mappings[key])));
      }
    }
    converter = new Converter(conversions);
  }

  static Converter getConverter() {
    return converter;
  }
}
