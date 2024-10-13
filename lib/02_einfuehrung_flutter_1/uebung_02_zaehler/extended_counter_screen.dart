import 'package:flutter/material.dart';

class ExtendedCounterScreen extends StatefulWidget {
  final int defaultValue;
  final int minimumValue;
  final int maximumValue;

  ExtendedCounterScreen({
    required this.defaultValue,
    required this.minimumValue,
    required this.maximumValue,
  });

  @override
  State<ExtendedCounterScreen> createState() => _ExtendedCounterScreenState();
}

class _ExtendedCounterScreenState extends State<ExtendedCounterScreen> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Zähler')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_counter.toString(), style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCountButton(icon: Icons.arrow_back, value: -1),
                SizedBox(width: 150),
                _buildCountButton(icon: Icons.arrow_forward, value: 1),
              ],
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => setState(() => _counter = widget.defaultValue),
              child: Text('Zurücksetzen'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountButton({required IconData icon, required int value}) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () => _addToCounter(value),
    );
  }

  void _addToCounter(int value) {
    if (_counter + value > widget.maximumValue
        || _counter + value < widget.minimumValue) return;

    setState(() => _counter += value);
  }
}
