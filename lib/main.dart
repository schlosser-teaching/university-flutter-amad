import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/praxis_centered_text/centered_text_screen.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/praxis_layout/layout_example_screen.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/uebung_profil/bonus/bonus_profile_page.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/uebung_profil/profile_page.dart';
import 'package:advanced_mobile_app_development/03_einfuehrung_flutter_2/praxis_routing/route_home_screen.dart';
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
      home: RouteHomeScreen(),
    );
  }
}
