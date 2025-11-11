import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  List<Exam> getExams() {
    final exams = [
      Exam(subject: 'Програмирање 1', date: '15.11.2025', time: '10:00', room: 'А1, А2'),
      Exam(subject: 'Математика 2', date: '17.12.2025', time: '09:00', room: 'Б3'),
      Exam(subject: 'Алгоритми и структури на податоци', date: '20.01.2025', time: '12:00', room: 'Лаб 2'),
      Exam(subject: 'Бази на податоци', date: '22.10.2025', time: '11:00', room: 'А4'),
      Exam(subject: 'Оперативни системи', date: '24.09.2025', time: '09:30', room: 'Лаб 1'),
      Exam(subject: 'Компјутерски мрежи', date: '26.11.2025', time: '13:00', room: 'Б2'),
      Exam(subject: 'ООП', date: '28.12.2025', time: '10:00', room: 'А3'),
      Exam(subject: 'Интернет технологии', date: '30.01.2025', time: '11:30', room: 'Лаб 3'),
      Exam(subject: 'Вештачка интелигенција', date: '02.02.2025', time: '09:00', room: 'Б1'),
      Exam(subject: 'Веројатност и статистика', date: '15.11.2025', time: '12:30', room: 'А2'),
    ];

    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return exams;
  }

  @override
  Widget build(BuildContext context) {
    final exams = getExams();
    final now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 201133'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                final isPast = exam.dateTime.isBefore(now);
                return ExamCard(exam: exam, isPast: isPast);
              },
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.indigo,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'Вкупно испити: ${exams.length}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
