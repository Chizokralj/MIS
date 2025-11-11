import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;
  const ExamDetailScreen({super.key, required this.exam});

  String timeUntilExam() {
    final parts = exam.date.split('.');
    final timeParts = exam.time.split(':');
    final examDate = DateTime(
      int.parse(parts[2]),
      int.parse(parts[1]),
      int.parse(parts[0]),
      int.parse(timeParts[0]),
      int.parse(timeParts[1]),
    );

    final now = DateTime.now();
    final diff = examDate.difference(now);

    if (diff.isNegative) return 'Испитот е веќе одржан';

    final days = diff.inDays;
    final hours = diff.inHours.remainder(24);
    return '$days дена, $hours часа';
  }

  @override
  Widget build(BuildContext context) {
    final remaining = timeUntilExam();

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exam.subject,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.indigo),
                      const SizedBox(width: 8),
                      Text('Датум: ${exam.date}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.indigo),
                      const SizedBox(width: 8),
                      Text('Време: ${exam.time}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.indigo),
                      const SizedBox(width: 8),
                      Text('Просторија: ${exam.room}'),
                    ],
                  ),
                  const Divider(height: 30, thickness: 1),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.hourglass_bottom, color: Colors.indigo),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          'До испитот преостануваат: $remaining',
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
