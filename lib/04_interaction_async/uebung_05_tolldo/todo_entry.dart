class TodoEntry {
  final String text;
  final TodoPriority priority;
  int remainingSeconds;

  TodoEntry({required this.text, required this.priority, this.remainingSeconds=60});
}

enum TodoPriority {
  low, medium, high
}

String getPriorityText(TodoPriority priority) {
  switch (priority) {
    case TodoPriority.low: return 'Niedrig';
    case TodoPriority.medium: return 'Mittel';
    case TodoPriority.high: return 'Hoch';
  }
}