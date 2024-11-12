import 'package:flutter/material.dart';

class LateStatefulScreen extends StatefulWidget {
  const LateStatefulScreen({super.key});

  @override
  State<LateStatefulScreen> createState() => _LateStatefulScreenState();
}

class _LateStatefulScreenState extends State<LateStatefulScreen> {
  late String _testString;

  @override
  void initState() {
    super.initState();
    _testString = 'Mein Test';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(_testString),
    );
  }
}
