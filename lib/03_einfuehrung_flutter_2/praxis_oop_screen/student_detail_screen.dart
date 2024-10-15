import 'package:advanced_mobile_app_development/03_einfuehrung_flutter_2/praxis_oop_screen/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentDetailScreen extends StatelessWidget {
  final Student student;

  const StudentDetailScreen({required this.student, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${student.firstName} ${student.lastName}')),
      body: Center(child: Column(
        children: [
          _buildTextRow(
            label: 'Name',
            value: '${student.firstName} ${student.lastName}',
            context: context
          ),
          _buildTextRow(
              label: 'Seminargruppe',
              value: student.seminarGroup,
              context: context
          ),
          _buildTextRow(
              label: 'Credits',
              value: student.credits.toString(),
              context: context
          ),
          ElevatedButton(
            onPressed: student.printInfo,
            child: Text('Infos ausgeben'),
          ),
        ],
      )),
    );
  }

  Widget _buildTextRow({required String label, required String value,
    required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(children: [
        Container(
          width: 100.0,
          child: Text(label, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: student.favoriteColor ?? Theme.of(context).primaryColor,
          )),
        ),
        const SizedBox(width: 30.0),
        Text(value),
      ]),
    );
  }
}
