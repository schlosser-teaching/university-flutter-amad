import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextChanger extends StatefulWidget {
  final String text;

  TextChanger({required this.text});

  @override
  State<StatefulWidget> createState() {
    return TextChangerState();
  }
}

class TextChangerState extends State<TextChanger> {
  bool _buttonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_buttonPressed ? 'Button gedrückt!' : widget.text),
            TextButton(
              onPressed: () => setState(() => _buttonPressed = true),
              child: Text('Drück mich :)'),
            ),
          ])),
    );
  }
}