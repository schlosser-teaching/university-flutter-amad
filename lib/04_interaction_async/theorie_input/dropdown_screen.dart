import 'package:flutter/material.dart';

class DropdownScreen extends StatefulWidget {
  const DropdownScreen({super.key});

  @override
  State<DropdownScreen> createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  int? _value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Selektierter Wert: ${_value ?? 'Keiner'}'),
          DropdownButton<int>(
            value: _value,
            items: const [
              DropdownMenuItem(value: 1, child: Text('Eins')),
              DropdownMenuItem(value: 2, child: Text('Zwei')),
              DropdownMenuItem(value: 3, child: Text('Drei')),
            ],
            onChanged: (value) => setState(() => _value = value),
          ),
        ],
      )),
    );
  }
}
