import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class StartEndDatePicker extends StatelessWidget {
  /// Provide two [DateTimePicker] in a row or column
  const StartEndDatePicker(
      {Key? key,
      this.direction = Axis.horizontal,
      this.startDateLabel = 'From',
      this.endDateLabel = 'To',
      this.startDateDecoration,
      this.endDateDecoration,
      required this.startDate,
      required this.endDate,
      required this.onStartDateChanged,
      required this.onEndDateChanged,
      this.padding = 0.0, this.width, this.height})
      : super(key: key);

  /// Control direction of [StartEndDatePicker]
  final Axis direction;

  /// Label string show on  top of field, e.g. 'From' and 'To'
  final String startDateLabel;
  final String endDateLabel;

  /// Initial [DateTime] of start date and end date
  final DateTime startDate;
  final DateTime endDate;

  /// Action when start date and end date changed
  final ValueChanged<DateTime> onStartDateChanged;
  final ValueChanged<DateTime> onEndDateChanged;

  /// Decoration for the field
  final InputDecoration? startDateDecoration;
  final InputDecoration? endDateDecoration;

  /// Padding between two field
  final double padding;

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    if (direction == Axis.horizontal) {
      return Row(
        children: [
          Expanded(child: _startDatePicker()),
          Container(
            width: padding,
          ),
          Expanded(child: _endDatePicker())
        ],
      );
    } else {
      return Column(
        children: [
          _startDatePicker(),
          Container(
            height: padding,
          ),
          _endDatePicker()
        ],
      );
    }
  }

  Widget _startDatePicker() {
    return Container(
      width: width,
      height: height,
      child: DateTimePicker(
        decoration: startDateDecoration,
        type: DateTimePickerType.date,
        dateLabelText: startDateLabel,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),
        initialValue: startDate.toString(),
        onChanged: (String date) {
          onStartDateChanged(DateTime.parse(date));
        },
      ),
    );
  }

  Widget _endDatePicker() {
    return Container(
      height: height,
      width: width,
      child: DateTimePicker(
        decoration: endDateDecoration,
        type: DateTimePickerType.date,
        dateLabelText: endDateLabel,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),
        initialValue: endDate.toString(),
        onChanged: (String date) {
          onEndDateChanged(DateTime.parse(date));
        },
      ),
    );
  }
}
