import 'package:flutter/material.dart';

class TextMappingScreen extends StatelessWidget {
  static const List<String> names = ['Max', 'Simon', 'Erika'];

  const TextMappingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Namen:'),
            const SizedBox(height: 20.0),
            ...names.map((name) => Text(name))
          ],
        ),
      ),
    );
  }
}
