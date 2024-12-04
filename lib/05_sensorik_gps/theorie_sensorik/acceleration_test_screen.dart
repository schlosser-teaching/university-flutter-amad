import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelerationTestScreen extends StatefulWidget {
  const AccelerationTestScreen({super.key});

  @override
  State<AccelerationTestScreen> createState() => _AccelerationTestScreenState();
}

class _AccelerationTestScreenState extends State<AccelerationTestScreen> {
  double? x;
  double? y;
  double? z;
  DateTime lastRefresh = DateTime.now();

  @override
  void initState() {
    super.initState();
    userAccelerometerEventStream().listen((event) {
      if (event.timestamp.difference(lastRefresh).inMilliseconds <= 100) {
        return;
      }

      lastRefresh = event.timestamp;
      print('X: ${event.x}, Y: ${event.y}, Z: ${event.z}');

      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
    },
    onError: (error) {
      // Fehler behandeln
    },
    cancelOnError: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beschleunigung')),
      body: Center(child: Text('X: ${x?.toStringAsFixed(2)}\nY: ${y?.toStringAsFixed(2)}\nZ: ${z?.toStringAsFixed(2)}')),
    );
  }
}
