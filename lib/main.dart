import 'package:advanced_mobile_app_development/01_einfuehrung_flutter_1/praxis_text/centered_text.dart';
import 'package:advanced_mobile_app_development/01_einfuehrung_flutter_1/praxis_text/layout_example.dart';
import 'package:flutter/material.dart';

import '01_einfuehrung_flutter_1/praxis_text/stateful_text_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Mobile App Development',
      theme: ThemeData(),
      home: TextChanger(text: 'Noch nicht gedrückt...'),
    );
  }
}
