import 'package:advanced_mobile_app_development/03_einfuehrung_flutter_2/uebung_04_gallerie/bonus/bonus_organ_gallery_detail_screen.dart';
import 'package:flutter/material.dart';

import 'bonus_organ.dart';

class BonusOrganGalleryOverviewScreen extends StatefulWidget {
  final List<BonusOrgan> organs = [
    const BonusOrgan(
      imagePath: 'assets/organ_brain.png',
      name: 'Gehirn',
      description: 'Ein Werkzeug zum Nachdenken.',
    ),
    const BonusOrgan(
      imagePath: 'assets/organ_gilebladder.png',
      name: 'Galle',
      description: 'Ein Fettspalter, der seinesgleichen sucht.',
    ),
    const BonusOrgan(
      imagePath: 'assets/organ_heart.png',
      name: 'Herz',
      description: 'Pumpt Blut und ist angeblich ein Symbol der Liebe.',
      organGroup: BonusOrganGroup.cardiovascular,
    ),
    const BonusOrgan(
      imagePath: 'assets/organ_intestine.png',
      name: 'Darmtrakt',
      description: 'Eine lustige Wasserrutsche für Nahrung.',
      organGroup: BonusOrganGroup.digestion,
    ),
    const BonusOrgan(
      imagePath: 'assets/organ_kidney.png',
      name: 'Nieren',
      description: 'Die Müllabfuhr aller Giftstoffe.',
    ),
    const BonusOrgan(
      imagePath: 'assets/organ_liver.png',
      name: 'Leber',
      description: 'Das beste aller Stoffwechsel-Organe.',
    ),
    const BonusOrgan(
      imagePath: 'assets/organ_lungs.png',
      name: 'Lunge',
      description: 'Raubt der Luft den Sauerstoff für das Blut.',
      organGroup: BonusOrganGroup.cardiovascular,
    ),
    const BonusOrgan(
      imagePath: 'assets/organ_skin.png',
      name: 'Haut',
      description: 'Ein großer Hautlappen, der alles überdeckt.',
    ),
    // BonusOrgan(
    //   imagePath: 'assets/organ_stomach.png',
    //   name: 'Magen',
    //   description: 'Hat viel Säure, um Nahrung kleinzubekommen.',
    // ),
  ];

  BonusOrganGalleryOverviewScreen({super.key});

  @override
  State<BonusOrganGalleryOverviewScreen> createState() => _BonusOrganGalleryOverviewScreenState();
}

class _BonusOrganGalleryOverviewScreenState extends State<BonusOrganGalleryOverviewScreen> {
  late List<BonusOrgan> includedOrgans;
  BonusOrganGroup? selectedOrganGroup;
  BonusOrgan? favoriteOrgan;

  @override
  void initState() {
    super.initState();
    includedOrgans = widget.organs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Galle-rie')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            DropdownMenu(
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: null, label: 'Alle'),
                DropdownMenuEntry(value: BonusOrganGroup.cardiovascular, label: 'Herz-Kreislauf'),
                DropdownMenuEntry(value: BonusOrganGroup.digestion, label: 'Verdauung'),
                DropdownMenuEntry(value: BonusOrganGroup.other, label: 'Sonstige'),
              ],
              onSelected: (organGroup) => setState(() => selectedOrganGroup = organGroup),
            ),
            const SizedBox(height: 10.0),
            Expanded(child: GridView.count(
              crossAxisCount: 3,
              children: includedOrgans
                  .where((organ) => selectedOrganGroup == null ||
                    organ.organGroup == selectedOrganGroup)
                  .map((organ) => _buildClickableOrgan(
                  organ: organ, context: context)).toList(),
            ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClickableOrgan({required BonusOrgan organ, required BuildContext context}) {
    final isFavorite = favoriteOrgan == organ;
    return GestureDetector(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(organ.imagePath, width: 100.0),
          ),
          if (isFavorite) const Icon(Icons.star, size: 40.0, color: Colors.yellow),
        ],
      ),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BonusOrganGalleryDetailScreen(
            organ: organ,
            isFavorite: isFavorite,
            onRemove: () => setState(() => includedOrgans.remove(organ)),
          ))),
      onLongPress: () => setState(() => favoriteOrgan = isFavorite ? null : organ),
    );
  }
}
