import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'show_model.dart';

class ShowDetailPage extends StatelessWidget {
  final Show show;

  const ShowDetailPage({required this.show, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(show.name)),
      body: Center(
        child: Column(
            children: [
              const SizedBox(height: 20.0),
              Text(
                show.name,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              if (show.imageUrl != null) Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Image.network(show.imageUrl!, height: 250.0),
              ),
              Text('Sprache: ${show.language}'),
              const SizedBox(height: 5.0),
              Text('Typ: ${show.type}'),
              const SizedBox(height: 5.0),
              Text('Genres: ${show.genres.join(', ')}'),
              const SizedBox(height: 5.0),
              if (show.averageRating != null) Text('Bewertung: ${show.averageRating} / 10'),
            ]),
      ),
    );
  }
}
