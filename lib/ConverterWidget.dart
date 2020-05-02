import 'package:flutter/material.dart';
import 'package:talkmoji/ConversionFactory.dart';
import 'package:talkmoji/converter.dart';

class ConverterWidget extends StatefulWidget {
  @override
  _ConverterWidgetState createState() => _ConverterWidgetState();
}

class _ConverterWidgetState extends State<ConverterWidget> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = new TextEditingController(text: 'Paste your text below to Talkmoji it!');
  }

  @override
  Widget build(BuildContext context) {
    Converter converter = ConversionFactory.getConverter();

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(border: Border.all()),
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              enabled: false,
              maxLines: 8,
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 8,
              onChanged: (text) {
                setState(
                  () {
                    _controller.text = converter.convert(text);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
