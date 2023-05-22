import 'package:flutter/material.dart';

Future<DateTime?> datePicker(BuildContext context,
    {DateTime? minTime, DateTime? maxTime, DateTime? currentTime}) async {
  return await showDatePicker(
      context: context,
      initialDate: currentTime ?? DateTime.now(),
      firstDate: minTime ?? DateTime(2020),
      lastDate: maxTime ?? DateTime(2100));
  // return await DatePicker.showDatePicker(context,
  //     showTitleActions: true,
  //     minTime: minTime ?? DateTime(2020),
  //     maxTime: maxTime ?? DateTime(2100),
  //     onConfirm: (dateTime) =>
  //         DateTime.parse(DateFormat('yyyy-MM-dd').format(dateTime)),
  //     currentTime: currentTime ?? DateTime.now());
}
