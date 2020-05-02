import 'package:talkmoji/conversions.dart';

class Converter {
  List<Conversion> conversions;

  Converter(List<Conversion> conversions) {
    this.conversions = conversions;
    this.conversions.sort((a, b) => b.from.length.compareTo(a.from.length));
  }

  String convert(String base) {
    String res = base;
    for (int i = 0; i < conversions.length; i++) {
      bool hasChanged = false;
      do {
        String newRes =
            res.replaceFirst(new RegExp(conversions[i].from, caseSensitive: false), conversions[i].getEmoji());
        hasChanged = res != newRes;
        res = newRes;
      } while (hasChanged);
    }
    return res;
  }
}
