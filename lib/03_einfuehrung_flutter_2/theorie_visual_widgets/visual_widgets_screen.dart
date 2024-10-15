import 'package:flutter/material.dart';

class VisualWidgetsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var text = Text('Hallo Welt!', textAlign: TextAlign.center);
    var image = Image.network(
        'https://plus.unsplash.com/premium_photo-1681711647066-ef84575c0d95',
    );
    var container = Container(width: 200, height: 300, color: Colors.lightBlue,);
    var placeholder = Placeholder(fallbackWidth: 150, fallbackHeight: 200,);

    var richText = Text.rich(
      TextSpan(
          children: [
            TextSpan(text: 'Hallo'),
            TextSpan(text: ' schöne ', style: TextStyle(fontStyle: FontStyle.italic)),
            TextSpan(text: 'Welt', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          ],
        )
    );

    return Scaffold(body: Center(child: richText));
  }
}
