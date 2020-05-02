import 'package:talkmoji/util.dart';

abstract class Conversion {
  String from;

  Conversion(this.from);

  String getEmoji();
}

class SingleConversion extends Conversion {
  String to;

  SingleConversion(String from, this.to) : super(from);

  @override
  String getEmoji() {
    return to;
  }
}

class MultipleConversion extends Conversion {
  List<String> to;

  MultipleConversion(String from, this.to) : super(from);

  @override
  String getEmoji() {
    return Util.getRandomEmojiFromList(to);
  }
}
