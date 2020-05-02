import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          Expanded(
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                enabled: false,
                maxLines: 20,
              ),
            ),
          ),
          RaisedButton(
            child: Text("Copy to clipboard", style: TextStyle(color: Colors.white)),
            color: Colors.purple,
            onPressed: () {
              Clipboard.setData(ClipboardData(text: _controller.text));
            },
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 20,
                onChanged: (text) {
                  setState(
                    () {
                      _controller.text = converter.convert(text);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
