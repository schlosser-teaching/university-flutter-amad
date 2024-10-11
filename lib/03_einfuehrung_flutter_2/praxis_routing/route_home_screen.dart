import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/praxis_centered_text/centered_text_screen.dart';
import 'package:flutter/material.dart';

class RouteHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(
        onPressed: () => navigateToText('Kurz gedrückt.', context),
        onLongPress: () => navigateToText('Lang gedrückt.', context),
        child: Text('Drück mich :)'),
      )),
    );
  }

  void navigateToText(String text, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CenteredTextScreen(displayText: text)
    ));
  }
}