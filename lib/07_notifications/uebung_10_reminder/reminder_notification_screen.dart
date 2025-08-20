import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart';

class ReminderNotificationScreen extends StatefulWidget {
  const ReminderNotificationScreen({super.key});

  @override
  State<ReminderNotificationScreen> createState() => _ReminderNotificationScreenState();
}

class _ReminderNotificationScreenState extends State<ReminderNotificationScreen> {
  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();
  final TextEditingController textController = TextEditingController();
  DateTime? selectedDateTime;

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: androidSettings);

    await notificationsPlugin.initialize(settings);

    await notificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  Future<void> _pickDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  Future<void> _scheduleNotification(String title, String body) async {
    if (selectedDateTime == null) return;

    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'scheduled_channel_id',
      'Scheduled Notifications',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(android: androidDetails);

    await notificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      TZDateTime.from(selectedDateTime!, local),
      details,
      androidScheduleMode: AndroidScheduleMode.exact,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Geplante Benachrichtigungen')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(labelText: 'Erinnerungstext'),
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: () => _pickDateTime(context),
                child: Text(selectedDateTime == null
                    ? 'Datum und Uhrzeit auswählen'
                    : 'Gewählt: ${DateFormat('dd.MM.yyyy HH:mm').format(selectedDateTime!)}'),
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: () {
                  if (selectedDateTime != null && textController.text.isNotEmpty) {
                    _scheduleNotification('Erinnerung', textController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Benachrichtigung geplant!')),
                    );
                  }
                },
                child: const Text('Benachrichtigung planen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
