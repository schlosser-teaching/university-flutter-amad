import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BonusExtendedCounterScreen extends StatefulWidget {
  final int defaultValue;
  final int minimumValue;
  final int maximumValue;
  final Color minimumColor;
  final Color maximumColor;

  BonusExtendedCounterScreen({
    required this.defaultValue,
    required this.minimumValue,
    required this.maximumValue,
    required this.minimumColor,
    required this.maximumColor,
  });

  @override
  State<BonusExtendedCounterScreen> createState() => _BonusExtendedCounterScreenState();
}

class _BonusExtendedCounterScreenState extends State<BonusExtendedCounterScreen> {
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
            Text(
              _counter.toString(),
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Color.lerp(
                  widget.minimumColor,
                  widget.maximumColor,
                  _counter / widget.maximumValue,
                ),
              )
            ),
            Text(_counter % 2 == 0 ? 'Gerade' : 'Ungerade'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCountButton(
                  icon: Icons.arrow_back_ios,
                  value: -5,
                  context: context,
                ),
                SizedBox(width: 20),
                _buildCountButton(
                  icon: Icons.arrow_back,
                  value: -1,
                  context: context,
                ),
                SizedBox(width: 150),
                _buildCountButton(
                  icon: Icons.arrow_forward,
                  value: 1,
                  context: context,
                ),
                SizedBox(width: 20),
                _buildCountButton(
                  icon: Icons.arrow_forward_ios,
                  value: 5,
                  context: context,
                ),
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

  Widget _buildCountButton({
    required IconData icon,
    required int value,
    required BuildContext context
  }) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () => _addToCounter(value, context),
    );
  }

  void _addToCounter(int value, BuildContext context) {
    if (_counter + value > widget.maximumValue
        || _counter + value < widget.minimumValue) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Wertebereich über-/unterschritten!')
      ));
      return;
    }

    setState(() => _counter += value);
  }
}
