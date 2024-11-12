import 'package:flutter/material.dart';

class CheckboxScreen extends StatefulWidget {
  final bool defaultValue;

  const CheckboxScreen({required this.defaultValue, super.key});

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  bool? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Checkbox(
        value: _value,
        onChanged: (value) => setState(() => _value = value),
      )),
    );
  }
}
