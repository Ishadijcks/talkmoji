import 'package:flutter/material.dart';
import 'package:talkmoji/ConversionFactory.dart';
import 'package:talkmoji/ConverterWidget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ConversionFactory.init();
  runApp(Talkmoji());
}

class Talkmoji extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talkmoji',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Say more. Talkmoji 🗣️"),
        ),
        body: Center(
          child: ConverterWidget(),
        ),
      ),
    );
  }
}
