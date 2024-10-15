import 'package:flutter/material.dart';

class RouteDetailScreen extends StatelessWidget {
  final String text;

  const RouteDetailScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Zurück'),
          ),
        ],
      )),
    );
  }
}
