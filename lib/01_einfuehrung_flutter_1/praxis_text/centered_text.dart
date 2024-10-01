import 'package:flutter/material.dart';

class CenteredText extends StatelessWidget {
  final String displayText;

  CenteredText({required this.displayText});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(displayText));
  }
}