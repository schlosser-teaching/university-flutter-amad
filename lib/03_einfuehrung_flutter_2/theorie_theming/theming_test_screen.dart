import 'package:flutter/material.dart';

class ThemingTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theming Test')),
      body: Column(
        children: [
          const Text('Test ohne Theming'),
          Text('Text mit Primärfarbe', style: Theme.of(context).textTheme.bodyMedium!
          .copyWith(color: Theme.of(context).primaryColor)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.account_box),
              Theme(
                data: ThemeData(iconTheme: IconThemeData(
                  size: 50.0,
                  color: Theme.of(context).primaryColor,
                )),
                child: const Icon(Icons.account_box),
              ),
            ],
          )
        ],
      ),
    );
  }
}
