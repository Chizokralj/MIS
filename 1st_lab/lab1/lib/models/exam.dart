class Exam {
  final String subject;
  final String date;
  final String time;
  final String room;

  Exam({
    required this.subject,
    required this.date,
    required this.time,
    required this.room,
  });
  DateTime get dateTime {
    final parts = date.split('.');
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);
    return DateTime(year, month, day);
  }
}
