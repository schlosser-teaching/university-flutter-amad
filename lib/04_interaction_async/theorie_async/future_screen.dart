import 'package:flutter/material.dart';

class FutureScreen extends StatelessWidget {
  const FutureScreen({super.key});

  Future<String> timeFuture() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Geladener Text!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: timeFuture(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Beim Laden ist ein Fehler aufgetreten.');
              }

              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }

              return Text(snapshot.data!);
            }
        ),
      ),
    );
  }
}
