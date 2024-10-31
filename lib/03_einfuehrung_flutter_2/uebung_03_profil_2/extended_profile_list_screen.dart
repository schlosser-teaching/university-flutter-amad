import 'package:advanced_mobile_app_development/03_einfuehrung_flutter_2/uebung_03_profil_2/extended_profile_screen.dart';
import 'package:flutter/material.dart';

import 'profile.dart';

class ExtendedProfileListScreen extends StatelessWidget {
  const ExtendedProfileListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil-Übersicht')),
      body: Column(
        children: [
          _buildListItem(profile: const Profile(
            firstName: 'Max',
            lastName: 'Schlosser',
            age: 24,
            username: 'Schloool',
            gender: Gender.male,
          ), context: context),
          _buildListItem(profile: const Profile(
            firstName: 'Erika',
            lastName: 'Musterfrau',
            age: 43,
            username: 'EMu',
            gender: Gender.female,
          ), context: context),
          _buildListItem(profile: const Profile(
            firstName: 'Maximilian',
            lastName: 'Mustermann',
            age: 62,
            username: 'PatternMan',
            gender: Gender.male,
          ), context: context),
        ],
      ),
    );
  }

  Widget _buildListItem({required Profile profile, required BuildContext context}) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ExtendedProfileScreen(profile: profile))),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          border: Border.symmetric(horizontal: BorderSide(
            color: Theme.of(context).primaryColor,
          ))
        ),
        child: Row(
          children: [
            const SizedBox(width: 10.0),
            profile.getFittingProfileImage(width: 50.0),
            const SizedBox(width: 20.0),
            Text(profile.username),
          ],
        ),
      ),
    );
  }
}
