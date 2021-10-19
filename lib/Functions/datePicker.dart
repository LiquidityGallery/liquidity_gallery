
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

Future<DateTime?> datePicker(BuildContext context, {DateTime? minTime, DateTime? maxTime, DateTime? currentTime}) async {
  return await                         DatePicker.showDatePicker(context,
      showTitleActions: true,
      minTime: minTime ?? DateTime(2020),
      maxTime: maxTime ?? DateTime(2100), onConfirm: (dateTime) => DateTime.parse(DateFormat('yyyy-MM-dd').format(dateTime)), currentTime: currentTime ?? DateTime.now());
}