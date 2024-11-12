import 'dart:convert';

import 'package:advanced_mobile_app_development/04_interaction_async/praxis_webrequest/random_fact_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RandomFactScreen extends StatefulWidget {
  const RandomFactScreen({super.key});

  @override
  State<RandomFactScreen> createState() => _RandomFactScreenState();
}

class _RandomFactScreenState extends State<RandomFactScreen> {
  late Future<Response> _randomFactFuture;

  @override
  void initState() {
    super.initState();
    loadRandomFact();
  }

  void loadRandomFact() {
    _randomFactFuture = get(
        Uri.parse('https://uselessfacts.jsph.pl/api/v2/facts/random?language=de'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: FutureBuilder(
        future: _randomFactFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Beim Laden ist ein Fehler aufgetreten.');
          }

          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          final randomFact = RandomFact.fromJson(jsonDecode(snapshot.data!.body));

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                randomFact.text,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              Text('Quelle: ${randomFact.source}'),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () => setState(() => loadRandomFact()),
                child: Text('Neuen Fakt laden')
              ),
            ],
          );
        },
      )),
    );
  }
}
