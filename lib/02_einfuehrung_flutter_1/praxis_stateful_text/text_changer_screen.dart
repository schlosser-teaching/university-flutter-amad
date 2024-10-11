import 'package:flutter/material.dart';

class TextChangerScreen extends StatefulWidget {
  final String text;

  TextChangerScreen({required this.text});

  @override
  State<StatefulWidget> createState() {
    return _TextChangerScreenState();
  }
}

class _TextChangerScreenState extends State<TextChangerScreen> {
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