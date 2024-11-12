import 'package:advanced_mobile_app_development/04_interaction_async/praxis_callback/callback_counter_button.dart';
import 'package:flutter/material.dart';

class CallbackTestScreen extends StatefulWidget {
  const CallbackTestScreen({super.key});

  @override
  State<CallbackTestScreen> createState() => _CallbackTestScreenState();
}

class _CallbackTestScreenState extends State<CallbackTestScreen> {
  int _presses = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gedrückt: $_presses'),
            const SizedBox(height: 20.0),
            CallbackCounterButton(
                onPress: (presses) => setState(() => _presses = presses),
            ),
          ],
        ),
      ),
    );
  }
}