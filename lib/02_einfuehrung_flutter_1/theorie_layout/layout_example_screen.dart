import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutExampleScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LayoutExampleScreen()
    ));
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Oben'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0)
                  .add(EdgeInsets.only(right: 100.0)),
              child: Text('Unten'),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}