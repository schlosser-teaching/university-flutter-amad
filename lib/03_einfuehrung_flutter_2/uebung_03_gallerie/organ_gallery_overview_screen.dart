import 'package:advanced_mobile_app_development/03_einfuehrung_flutter_2/uebung_03_gallerie/organ_gallery_detail_screen.dart';
import 'package:flutter/material.dart';

import 'organ.dart';

class OrganGalleryOverviewScreen extends StatelessWidget {
  static const List<Organ> organs = [
    Organ(
      imagePath: 'assets/organ_brain.png',
      name: 'Gehirn',
      description: 'Ein Werkzeug zum Nachdenken.',
    ),
    Organ(
      imagePath: 'assets/organ_gilebladder.png',
      name: 'Galle',
      description: 'Ein Fettspalter, der seinesgleichen sucht.',
    ),
    Organ(
      imagePath: 'assets/organ_heart.png',
      name: 'Herz',
      description: 'Pumpt Blut und ist angeblich ein Symbol der Liebe.',
    ),
    Organ(
      imagePath: 'assets/organ_intestine.png',
      name: 'Darmtrakt',
      description: 'Eine lustige Wasserrutsche für Nahrung.',
    ),
    Organ(
      imagePath: 'assets/organ_kidney.png',
      name: 'Nieren',
      description: 'Die Müllabfuhr aller Giftstoffe.',
    ),
    Organ(
      imagePath: 'assets/organ_liver.png',
      name: 'Leber',
      description: 'Das beste aller Stoffwechsel-Organe.',
    ),
    Organ(
      imagePath: 'assets/organ_lungs.png',
      name: 'Lunge',
      description: 'Raubt der Luft den Sauerstoff für das Blut.',
    ),
    Organ(
      imagePath: 'assets/organ_skin.png',
      name: 'Haut',
      description: 'Ein großer Hautlappen, der alles überdeckt.',
    ),
    Organ(
      imagePath: 'assets/organ_stomach.png',
      name: 'Magen',
      description: 'Hat viel Säure, um Nahrung kleinzubekommen.',
    ),
  ];

  const OrganGalleryOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Galle-rie')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _buildClickableOrgan(organ: organs[0], context: context),
              _buildClickableOrgan(organ: organs[1], context: context),
              _buildClickableOrgan(organ: organs[2], context: context),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _buildClickableOrgan(organ: organs[3], context: context),
              _buildClickableOrgan(organ: organs[4], context: context),
              _buildClickableOrgan(organ: organs[5], context: context),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _buildClickableOrgan(organ: organs[6], context: context),
              _buildClickableOrgan(organ: organs[7], context: context),
              _buildClickableOrgan(organ: organs[8], context: context),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildClickableOrgan({required Organ organ, required BuildContext context}) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(organ.imagePath, width: 100.0),
      ),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OrganGalleryDetailScreen(organ: organ))),
    );
  }
}
