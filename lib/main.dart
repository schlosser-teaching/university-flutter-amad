import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/praxis_text/centered_text.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/praxis_text/layout_example.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/uebung_profil/bonus/bonus_profile_page.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/uebung_profil/profile_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Mobile App Development',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProfilePage(),
    );
  }
}
