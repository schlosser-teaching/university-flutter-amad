import 'package:flutter/material.dart';

import 'bonus_organ.dart';

class BonusOrganGalleryDetailScreen extends StatelessWidget {
  final BonusOrgan organ;
  final bool isFavorite;
  final void Function()? onRemove;

  const BonusOrganGalleryDetailScreen({required this.organ,
    required this.isFavorite, this.onRemove, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${organ.name ?? 'Organ'}: Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(organ.name ?? 'Unbekanntes Organ',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 40.0),
            Image.asset(organ.imagePath, width: 250.0),
            if (organ.description != null) Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Text(organ.description!),
            ),

            ElevatedButton(
                onPressed: () {
                  onRemove?.call();
                  Navigator.of(context).pop();
                },
                child: const Text('Organ entfernen'),
            ),

            const SizedBox(height: 30.0),
            if (isFavorite) const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star),
                  SizedBox(width: 10.0),
                  Text('Dieses Organ ist als Favorit markiert.'),
                ]),
          ],
        ),
      ),
    );
  }
}
