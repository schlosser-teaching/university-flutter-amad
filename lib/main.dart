import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/praxis_centered_text/centered_text_screen.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/praxis_stateful_text/text_changer_screen.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/theorie_layout/layout_example_screen.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/uebung_01_profil/bonus/bonus_profile_screen.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/uebung_01_profil/profile_screen.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/uebung_02_zaehler/bonus/bonus_extended_counter_screen.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/uebung_02_zaehler/extended_counter_screen.dart';
import 'package:advanced_mobile_app_development/03_einfuehrung_flutter_2/praxis_routing/route_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // 02 - Einführung Flutter 1
  var centeredScreen = CenteredTextScreen(displayText: 'Hallo Welt!');
  var layoutExampleScreen = LayoutExampleScreen();
  var textChangerScreen = TextChangerScreen(text: 'Noch nicht gedrückt :(');
  var profileScreen = ProfileScreen();
  var bonusProfileScreen = BonusProfileScreen();
  var extendedCounterScreen = ExtendedCounterScreen(
    defaultValue: 5,
    minimumValue: 0,
    maximumValue: 10,
  );
  var bonusExtendedCounterScreen = BonusExtendedCounterScreen(
    defaultValue: 5,
    minimumValue: 0,
    maximumValue: 10,
    minimumColor: Colors.red,
    maximumColor: Colors.green,
  );

  // 03 - Einführung Flutter 2
  var routeHomeScreen = RouteHomeScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Mobile App Development',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: bonusExtendedCounterScreen,
    );
  }
}
