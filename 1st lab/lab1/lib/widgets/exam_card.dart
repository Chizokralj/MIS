import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final bool isPast;

  const ExamCard({
    super.key,
    required this.exam,
    required this.isPast,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isPast ? Colors.grey[300] : Colors.lightBlue[50],
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          Icons.school,
          color: isPast ? Colors.grey : Colors.indigo,
          size: 30,
        ),
        title: Text(
          exam.subject,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isPast ? Colors.black54 : Colors.black87,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.indigo),
                const SizedBox(width: 5),
                Text('Датум: ${exam.date}'),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: Colors.indigo),
                const SizedBox(width: 5),
                Text('Време: ${exam.time}'),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.indigo),
                const SizedBox(width: 5),
                Text('Просторија: ${exam.room}'),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExamDetailScreen(exam: exam),
            ),
          );
        },
      ),
    );
  }
}
