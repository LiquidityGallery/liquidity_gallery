
num timeDifference(DateTime timestamp) {
  late DateTime secondDate;
    secondDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );


  final different = DateTime(timestamp.year, timestamp.month, timestamp.day)
      .difference(secondDate);

  final num days = num.tryParse(different == const Duration() ? '' : '${different.inDays}')?? 0;
  // final differentString = days.isEmpty
  //     ? '今日'
  //     : (different == const Duration(days: 1) ? ' 明天' : ' 餘下$days天');
  return days;
}
