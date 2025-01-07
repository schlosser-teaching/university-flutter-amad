import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationScreen extends StatefulWidget {
  const PushNotificationScreen({super.key});

  @override
  State<PushNotificationScreen> createState() => _PushNotificationScreenState();
}

class _PushNotificationScreenState extends State<PushNotificationScreen> {
  final WebSocketChannel channel = WebSocketChannel.connect(Uri.parse('ws://109.71.253.101:8099'));
  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  String? latestNotificationTitle;
  String? latestNotificationMessage;

  @override
  void initState() {
    super.initState();
    _initializeNotifications();

    channel.stream.listen((message) {
      final data = jsonDecode(message);
      setState(() {
        latestNotificationTitle = data['title'];
        latestNotificationMessage = data['message'];
      });

      _showNotification(data['title'], data['message']);
    });
  }

  Future<void> _initializeNotifications() async {
    await notificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: androidSettings);
    await notificationsPlugin.initialize(settings);
  }

  Future<void> _showNotification(String title, String body) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        'channel_id', 'Notifications', importance: Importance.high, priority: Priority.high);
    const NotificationDetails details = NotificationDetails(android: androidDetails);
    await notificationsPlugin.show(0, title, body, details);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Push Notifications")),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (latestNotificationTitle == null) const Text("Warte auf Benachrichtigungen..."),

                if (latestNotificationTitle != null) Column(
                  children: [
                    const Text("Neueste Benachrichtigung: "),
                    const SizedBox(height: 15.0),
                    Text(latestNotificationTitle!),
                    Text(latestNotificationMessage!),
                  ],
                ),

                const SizedBox(height: 25.0),
                TextField(controller: titleController),
                TextField(controller: messageController),
                ElevatedButton(
                  onPressed: () => post(
                      Uri.parse('http://109.71.253.101:3000/send-notification'),
                      headers: {
                        "Content-Type": "application/json",
                      },
                      body: jsonEncode({
                        "title": titleController.text,
                        "message": messageController.text,
                      })
                  ),
                  child: const Text('An alle senden')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
