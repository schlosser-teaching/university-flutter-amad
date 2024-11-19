import 'package:advanced_mobile_app_development/04_interaction_async/uebung_05_tolldo/todo_entry.dart';
import 'package:flutter/material.dart';

class TodoCreateScreen extends StatefulWidget {
  final ValueSetter<TodoEntry>? onCreateEntry;

  const TodoCreateScreen({this.onCreateEntry, super.key});

  @override
  State<TodoCreateScreen> createState() => _TodoCreateScreenState();
}

class _TodoCreateScreenState extends State<TodoCreateScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _textController = TextEditingController();
  TodoPriority? _currentPriority = TodoPriority.medium;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Neue Toll-Do')),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _textController,
                  validator: (text) {
                    if ((text?.length ?? 0) < 5) {
                      return 'Der Text muss mindestens 5 Zeichen lang sein.';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                DropdownButtonFormField(
                  items: TodoPriority.values.map((priority) => DropdownMenuItem(
                      value: priority,
                      child: Text(getPriorityText(priority))
                  )).toList(),
                  value: _currentPriority,
                  onChanged: (priority) => _currentPriority = priority,
                  validator: (priority) {
                    if (priority == null) {
                      return 'Bitte wähle eine Priorität.';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 50.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      widget.onCreateEntry?.call(TodoEntry(
                          text: _textController.text,
                          priority: _currentPriority ?? TodoPriority.medium
                      ));
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Erstellen'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
