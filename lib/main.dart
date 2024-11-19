import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/praxis_centered_text/centered_text_screen.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/praxis_stateful_text/text_changer_screen.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/theorie_layout/layout_example_screen.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/uebung_01_profil/bonus/bonus_profile_screen.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/uebung_01_profil/profile_screen.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/uebung_02_zaehler/bonus/bonus_extended_counter_screen.dart';
import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/uebung_02_zaehler/extended_counter_screen.dart';
import 'package:advanced_mobile_app_development/03_einfuehrung_flutter_2/praxis_oop_screen/student.dart';
import 'package:advanced_mobile_app_development/03_einfuehrung_flutter_2/praxis_oop_screen/student_detail_screen.dart';
import 'package:advanced_mobile_app_development/03_einfuehrung_flutter_2/praxis_routing/route_home_screen.dart';
import 'package:advanced_mobile_app_development/03_einfuehrung_flutter_2/theorie_theming/theming_test_screen.dart';
import 'package:advanced_mobile_app_development/03_einfuehrung_flutter_2/theorie_visual_widgets/visual_widgets_screen.dart';
import 'package:advanced_mobile_app_development/03_einfuehrung_flutter_2/uebung_03_profil_2/bonus/bonus_extended_profile_list_screen.dart';
import 'package:advanced_mobile_app_development/03_einfuehrung_flutter_2/uebung_03_profil_2/extended_profile_list_screen.dart';
import 'package:advanced_mobile_app_development/03_einfuehrung_flutter_2/uebung_04_gallerie/bonus/bonus_organ_gallery_overview_screen.dart';
import 'package:advanced_mobile_app_development/03_einfuehrung_flutter_2/uebung_04_gallerie/organ_gallery_overview_screen.dart';
import 'package:advanced_mobile_app_development/04_interaction_async/praxis_callback/callback_test_screen.dart';
import 'package:advanced_mobile_app_development/04_interaction_async/praxis_webrequest/random_fact_screen.dart';
import 'package:advanced_mobile_app_development/04_interaction_async/theorie_async/future_screen.dart';
import 'package:advanced_mobile_app_development/04_interaction_async/theorie_declarative/text_mapping_screen.dart';
import 'package:advanced_mobile_app_development/04_interaction_async/theorie_input/checkbox_screen.dart';
import 'package:advanced_mobile_app_development/04_interaction_async/praxis_form/form_screen.dart';
import 'package:advanced_mobile_app_development/04_interaction_async/theorie_input/dropdown_screen.dart';
import 'package:advanced_mobile_app_development/04_interaction_async/theorie_input/radio_button_screen.dart';
import 'package:advanced_mobile_app_development/04_interaction_async/theorie_input/text_field_screen.dart';
import 'package:advanced_mobile_app_development/04_interaction_async/uebung_05_tolldo/todo_list_screen.dart';
import 'package:advanced_mobile_app_development/04_interaction_async/uebung_06_shows/show_search_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // 02 - Einführung Flutter 1
  final centeredScreen = CenteredTextScreen(displayText: 'Hallo Welt!');
  final layoutExampleScreen = LayoutExampleScreen();
  final textChangerScreen = TextChangerScreen(text: 'Noch nicht gedrückt :(');
  final profileScreen = ProfileScreen();
  final bonusProfileScreen = BonusProfileScreen();
  final extendedCounterScreen = ExtendedCounterScreen(
    defaultValue: 5,
    minimumValue: 0,
    maximumValue: 10,
  );
  final bonusExtendedCounterScreen = BonusExtendedCounterScreen(
    defaultValue: 5,
    minimumValue: 0,
    maximumValue: 10,
    minimumColor: Colors.red,
    maximumColor: Colors.green,
  );

  // 03 - Einführung Flutter 2
  final visualWidgetsScreen = VisualWidgetsScreen();
  final routeHomeScreen = RouteHomeScreen();
  final themingTestScreen = ThemingTestScreen();
  final studentDetailScreen = StudentDetailScreen(student: Student(
    firstName: 'Erika',
    lastName: 'Musterfrau',
    seminarGroup: 'MI23-w2-B',
    credits: 30,
  ));
  final extendedProfileListScreen = const ExtendedProfileListScreen();
  final bonusExtendedProfileListScreen = const BonusExtendedProfileListScreen();
  final organGalleryOverviewScreen = const OrganGalleryOverviewScreen();
  final bonusOrganGalleryOverviewScreen = BonusOrganGalleryOverviewScreen();

  // 04 - Interaktion und asynchrone Programmierung
  final textFieldScreen = const TextFieldScreen();
  final checkboxScreen = const CheckboxScreen(defaultValue: true);
  final radioButtonScreen = const RadioButtonScreen();
  final dropdownScreen = const DropdownScreen();
  final textMappingScreen = const TextMappingScreen();
  final futureScreen = const FutureScreen();
  final formScreen = const FormScreen();
  final callbackTestScreen = const CallbackTestScreen();
  final randomFactScreen = const RandomFactScreen();
  final todoListScreen = const TodoListScreen();
  final showSearchScreen = const ShowSearchScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Mobile App Development',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
      ),
      home: showSearchScreen,
    );
  }
}
