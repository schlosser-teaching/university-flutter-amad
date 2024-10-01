import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Oben'),
            Text('Unten'),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}