import 'package:flutter/material.dart';

class CenteredTextScreen extends StatelessWidget {
  final String displayText;

  CenteredTextScreen({required this.displayText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text(displayText)));
  }
}