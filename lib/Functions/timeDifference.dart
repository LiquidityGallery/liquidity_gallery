import 'package:flutter/material.dart';

String timeDifference(DateTime timestamp, DateTime? secondTimestamp) {
  late DateTime secondDate;
  if (secondTimestamp == null) {
    secondDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
  } else {
    secondDate = secondTimestamp;
  }

  final different = DateTime(timestamp.year, timestamp.month, timestamp.day)
      .difference(secondDate);

  final days = different == const Duration() ? '' : '${different.inDays}';
  final differentString = days.isEmpty
      ? '今日'
      : (different == const Duration(days: 1) ? ' 明天' : ' 餘下$days天');
  return differentString;
}
