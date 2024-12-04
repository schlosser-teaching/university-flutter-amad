import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class PunchCalculatorScreen extends StatefulWidget {
  const PunchCalculatorScreen({super.key});

  @override
  State<PunchCalculatorScreen> createState() => _PunchCalculatorScreenState();
}

class _PunchCalculatorScreenState extends State<PunchCalculatorScreen> {
  static const double deadzone = 1;

  double currentForceScore = 0.0;
  double maxForceScore = 0.0;

  @override
  void initState() {
    super.initState();

    userAccelerometerEventStream().listen((event) {
      if (event.z <= 0 || event.z < deadzone) {
        setState(() => currentForceScore = 0);
        return;
      };

      setState(() {
        currentForceScore = sqrt(event.z);
        maxForceScore = max(maxForceScore, currentForceScore);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kraftmesser')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Max. Kraft: ${maxForceScore.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Text(
              'Aktuelle Kraft: ${currentForceScore.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            const Text(
              'Halte dein Handy in der Hand und schlage gerade nach vorn. '
                  'Bitte lasse es dabei nicht los.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
