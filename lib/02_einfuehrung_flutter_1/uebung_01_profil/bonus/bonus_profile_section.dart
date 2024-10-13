import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BonusProfileSection extends StatefulWidget {
  final String title;
  final IconData icon;
  final String initialValue;

  BonusProfileSection({required this.title, required this.icon, required this.initialValue});

  @override
  State<BonusProfileSection> createState() => _BonusProfileSectionState();
}

class _BonusProfileSectionState extends State<BonusProfileSection> {
  bool _isEditing = false;
  late String currentValue;
  late TextEditingController textEditingController;

  @override
  void initState() {
    currentValue = widget.initialValue;
    textEditingController = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(children: [
        Icon(widget.icon),
        SizedBox(width: 15),
        Expanded(child: _isEditing ?
        TextField(
          controller: textEditingController,
          onChanged: (value) => setState(() => currentValue = value),
        ) :
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: Theme.of(context).textTheme.bodySmall),
              Text(currentValue, style: Theme.of(context).textTheme.bodyLarge),
            ])),
        IconButton(
            onPressed: () => setState(() => _isEditing = !_isEditing),
            icon: Icon(Icons.edit)
        ),
      ]),
    );
  }
}