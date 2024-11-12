import 'package:flutter/material.dart';

class RadioButtonScreen extends StatefulWidget {
  const RadioButtonScreen({super.key});

  @override
  State<RadioButtonScreen> createState() => _RadioButtonScreenState();
}

class _RadioButtonScreenState extends State<RadioButtonScreen> {
  DrinkChoice? _drinkChoice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildRadioChoice(choice: DrinkChoice.tea, text: 'Tee'),
        _buildRadioChoice(choice: DrinkChoice.coffee, text: 'Kaffee'),
        _buildRadioChoice(choice: DrinkChoice.water, text: 'Wasser'),
      ]),
    );
  }

  Widget _buildRadioChoice({required DrinkChoice choice, required String text}) {
    return Row(
      children: [
        Radio<DrinkChoice>(
          value: choice,
          groupValue: _drinkChoice,
          onChanged: (choice) => setState(() => _drinkChoice = choice),
        ),
        const SizedBox(width: 20.0),
        Text(text),
      ],
    );
  }
}

enum DrinkChoice {
  coffee, tea, water
}
