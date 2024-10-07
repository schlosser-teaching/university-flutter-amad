import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/uebung_profil/profile_section.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mein Profil')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
            children: [
              Center(child: Image.asset('assets/profile_male.png', width: 100.0)),
              SizedBox(height: 10),
              Text('Schloool', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 50),

              ProfileSection(
                  title: 'Vorname',
                  icon: Icons.man,
                  value: 'Max',
              ),
              ProfileSection(
                title: 'Name',
                icon: Icons.account_box_outlined,
                value: 'Schlosser',
              ),
              ProfileSection(
                title: 'Alter',
                icon: Icons.watch_later_outlined,
                value: '23',
              ),
            ]),
      ),
    );
  }
}