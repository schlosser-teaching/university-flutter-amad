import 'package:flutter/material.dart';

import 'organ.dart';

class OrganGalleryDetailScreen extends StatelessWidget {
  final Organ organ;

  const OrganGalleryDetailScreen({required this.organ, super.key});

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
            const SizedBox(height: 30.0),
            if (organ.description != null) Text(organ.description!),
          ],
        ),
      ),
    );
  }
}
