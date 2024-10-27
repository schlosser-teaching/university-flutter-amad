import 'package:flutter/material.dart';

import 'bonus_profile_section.dart';

class BonusProfileScreen extends StatefulWidget {

  @override
  State<BonusProfileScreen> createState() => _BonusProfileScreenState();
}

class _BonusProfileScreenState extends State<BonusProfileScreen> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.grey : Colors.white,
      appBar: AppBar(title: Text('Mein Profil')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
              children: [
                SizedBox(height: 20),
                Center(child: Image.asset('assets/profile_male.png', width: 100.0)),
                SizedBox(height: 10),
                Text('Schloool', style: Theme.of(context).textTheme.titleLarge),
                SizedBox(height: 50),

                BonusProfileSection(
                    title: 'Vorname',
                    icon: Icons.man,
                    initialValue: 'Max',
                ),
                BonusProfileSection(
                  title: 'Name',
                  icon: Icons.account_box_outlined,
                  initialValue: 'Schlosser',
                ),
                BonusProfileSection(
                  title: 'Alter',
                  icon: Icons.watch_later_outlined,
                  initialValue: '23',
                ),

                SizedBox(height: 50),
                TextButton(
                    onPressed: () => setState(() => _isDarkMode = !_isDarkMode),
                    child: Text('Darkmode ein/aus'),
                )
              ]),
        ),
      ),
    );
  }
}