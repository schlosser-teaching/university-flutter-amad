import 'package:flutter/material.dart';

class CallbackCounterButton extends StatefulWidget {
  final ValueChanged<int>? onPress;

  const CallbackCounterButton({this.onPress, super.key});

  @override
  State<CallbackCounterButton> createState() => _CallbackCounterButtonState();
}

class _CallbackCounterButtonState extends State<CallbackCounterButton> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          counter++;
          widget.onPress?.call(counter);
        },
        child: const Text('Drück mich'),
    );
  }
}
