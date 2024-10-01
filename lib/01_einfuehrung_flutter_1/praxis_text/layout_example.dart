import 'package:flutter/cupertino.dart';

class LayoutExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Oben'),
          Text('Unten'),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}