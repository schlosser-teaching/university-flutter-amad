import 'dart:async';

import 'package:advanced_mobile_app_development/04_interaction_async/uebung_05_tolldo/todo_create_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'todo_entry.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoEntry> _entries = [];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _entries.forEach((e) => e.remainingSeconds--);
        _entries = _entries.where((e) => e.remainingSeconds > 0).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Toll-Dos')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TodoCreateScreen(
              onCreateEntry: (entry) => setState(() => _entries.add(entry)),
            ))),
      ),
      body: Column(
        children: _entries.map((e) => _buildTodoEntry(
            entry: e,
            context: context,
        )).toList(),
      ),
    );
  }

  Widget _buildTodoEntry({required TodoEntry entry, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry.text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
                Text('Priorität: ${getPriorityText(entry.priority)}'),
              ],
            ),
          ),
          Text('Verbleibend: \n${entry.remainingSeconds} Sekunden'),
        ],
      ),
    );
  }
}
