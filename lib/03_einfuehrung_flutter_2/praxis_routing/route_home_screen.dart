import 'package:advanced_mobile_app_development/03_einfuehrung_flutter_2/praxis_routing/route_detail_screen.dart';
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
        builder: (context) => RouteDetailScreen(text: text)
    ));
  }
}