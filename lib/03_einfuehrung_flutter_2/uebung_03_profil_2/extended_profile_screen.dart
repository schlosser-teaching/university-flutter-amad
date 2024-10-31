import 'package:advanced_mobile_app_development/02_einfuehrung_flutter_1/uebung_01_profil/profile_section.dart';
import 'package:flutter/material.dart';

import 'profile.dart';

class ExtendedProfileScreen extends StatelessWidget {
  final Profile profile;

  const ExtendedProfileScreen({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil: ${profile.username}')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
            children: [
              const SizedBox(height: 20),
              Center(child: profile.getFittingProfileImage(width: 100.0)),
              const SizedBox(height: 10),
              Text(profile.username, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 50),

              ProfileSection(
                  title: 'Vorname',
                  icon: Icons.man,
                  value: profile.firstName,
              ),
              ProfileSection(
                title: 'Name',
                icon: Icons.account_box_outlined,
                value: profile.lastName,
              ),
              ProfileSection(
                title: 'Alter',
                icon: Icons.watch_later_outlined,
                value: profile.age.toString(),
              ),
            ]),
      ),
    );
  }
}