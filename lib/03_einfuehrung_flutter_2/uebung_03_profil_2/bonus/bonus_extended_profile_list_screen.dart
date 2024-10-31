import 'package:advanced_mobile_app_development/03_einfuehrung_flutter_2/uebung_03_profil_2/extended_profile_screen.dart';
import 'package:flutter/material.dart';

import '../profile.dart';

class BonusExtendedProfileListScreen extends StatefulWidget {
  const BonusExtendedProfileListScreen({super.key});

  @override
  State<BonusExtendedProfileListScreen> createState() => _BonusExtendedProfileListScreenState();
}

class _BonusExtendedProfileListScreenState extends State<BonusExtendedProfileListScreen> {
  String? _searchWord;
  bool sortByUsername = false;
  bool sortAscending = true;
  late List<Profile> profiles;

  @override
  void initState() {
    super.initState();
    profiles = [
      const Profile(
        firstName: 'Max',
        lastName: 'Schlosser',
        age: 24,
        username: 'Schloool',
        gender: Gender.male,
      ),
      const Profile(
        firstName: 'Erika',
        lastName: 'Musterfrau',
        age: 43,
        username: 'EMu',
        gender: Gender.female,
      ),
      const Profile(
        firstName: 'Maximilian',
        lastName: 'Mustermann',
        age: 62,
        username: 'PatternMan',
        gender: Gender.male,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final sortedProfiles = List.from(profiles);
    if (sortByUsername) {
      sortedProfiles.sort((a, b) {
        final compare = a.username.compareTo(b.username);
        return sortAscending ? compare : -compare;
      });
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Profil-Übersicht')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(child: _buildSearchBar()),
                _buildSortButton(),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          ...sortedProfiles
              .where((profile) => (_searchWord?.isEmpty ?? true) ||
              profile.username.toLowerCase().contains(_searchWord!.toLowerCase()))
              .map((profile) => _buildListItem(
            profile: profile,
            context: context,
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => setState(() => profiles.add(const Profile(
          firstName: 'Dummy',
          lastName: 'Profil',
          age: 20,
          username: 'HerrDummy',
          gender: Gender.other,
        ))),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onChanged: (text) => setState(() => _searchWord = text),
    );
  }

  Widget _buildSortButton() {
    return IconButton(
      onPressed: () => setState(() {
        if (!sortByUsername) {
          sortByUsername = true;
          return;
        }

        if (sortByUsername && !sortAscending) {
          sortByUsername = false;
          sortAscending = true;
          return;
        }

        sortAscending = !sortAscending;
      }),
      icon: Icon(
        sortAscending ? Icons.arrow_upward : Icons.arrow_downward,
        color: sortByUsername ? Theme.of(context).primaryColor : Colors.grey,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              profile.getFittingProfileImage(width: 50.0),
              const SizedBox(width: 20.0),
              Text(profile.username),
              const Spacer(),
              IconButton(
                onPressed: () => setState(() => profiles.remove(profile)),
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
