import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PriceChart extends StatefulWidget {
  /// Create a simple price and time chart.
  const PriceChart({Key? key, this.height = 300, required this.data})
      : super(key: key);

  /// Define this widget's height.
  final double? height;

  /// Chart's data
  final List<PriceChartData> data;

  factory PriceChart.withSampleData() {
    return PriceChart(data: _sampleData);
  }

  @override
  State<PriceChart> createState() => _PriceChartState();

  static final List<PriceChartData> _sampleData = [
    PriceChartData(price: 100, time: DateTime(2021, 10, 5)),
    PriceChartData(price: 110, time: DateTime(2021, 11, 2)),
    PriceChartData(price: 130, time: DateTime(2021, 11, 22)),
    PriceChartData(price: 150, time: DateTime(2021, 12, 3)),
    PriceChartData(price: 120, time: DateTime(2022, 1, 5)),
    PriceChartData(price: 100, time: DateTime(2022, 2, 3)),
    PriceChartData(price: 86, time: DateTime(2022, 2, 11)),
    PriceChartData(price: 66, time: DateTime(2022, 2, 19)),
    PriceChartData(price: 89, time: DateTime(2022, 3, 1)),
    PriceChartData(price: 96, time: DateTime(2022, 3, 5)),
    PriceChartData(price: 153, time: DateTime(2022, 3, 15)),
    PriceChartData(price: 127, time: DateTime(2022, 3, 20)),
    PriceChartData(price: 118, time: DateTime(2022, 3, 28)),
    PriceChartData(price: 200, time: DateTime(2022, 4, 4)),
    PriceChartData(price: 176, time: DateTime(2022, 4, 7)),
    PriceChartData(price: 97, time: DateTime(2022, 10, 5)),
    PriceChartData(price: 91, time: DateTime(2022, 10, 8)),
    PriceChartData(price: 66, time: DateTime(2022, 10, 15)),
    PriceChartData(price: 149, time: DateTime(2022, 12, 9))
  ];
}

class _PriceChartState extends State<PriceChart> {
  TimeRange timeRange = TimeRange.all;

  void onChangeCallback(Point<int> point, dynamic domain, String roleId,
      charts.SliderListenerDragState dragState) {
    print(domain);
    print(dragState.toString());
    print(point);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Column(children: [
        SizedBox(
          height: 30,
          child: _TimeRangeList(
            timeRange: timeRange,
            onChanged: (TimeRange timeRange) {
              setState(() {
                this.timeRange = timeRange;
              });
            },
          ),
        ),
        SizedBox(
          height: widget.height! - 30,
          child: _filterData().isEmpty
              ? const Center(
                  child: Text('No data.'),
                )
              : charts.TimeSeriesChart(
                  _createData(),
                  animate: false,
                  defaultRenderer: charts.LineRendererConfig(
                      includeArea: true, stacked: true),
                ),
        )
      ]),
    );
  }

  List<charts.Series<PriceChartData, DateTime>> _createData() {
    return [
      charts.Series<PriceChartData, DateTime>(
          id: 'Main',
          domainFn: (PriceChartData data, _) => data.time,
          measureFn: (PriceChartData data, _) => data.price,
          data: _filterData()),
    ];
  }

  List<PriceChartData> _filterData() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final nextDay = DateTime(now.year, now.month, now.day + 1);
    final thisWeek = DateTime(now.year, now.month, now.day - now.weekday + 1);
    final nextWeek = DateTime(now.year, now.month, now.day + now.weekday);
    final thisMonth = DateTime(now.year, now.month);
    final nextMonth = DateTime(now.year, now.month + 1);
    final thisYear = DateTime(now.year);
    final nextYear = DateTime(now.year + 1);

    switch (timeRange) {
      case TimeRange.oneDay:
        return widget.data
            .where((e) => e.time.isAfter(today) && e.time.isBefore(nextDay))
            .toList();
      case TimeRange.oneWeek:
        return widget.data
            .where((e) => e.time.isAfter(thisWeek) && e.time.isBefore(nextWeek))
            .toList();
      case TimeRange.oneMonth:
        return widget.data
            .where(
                (e) => e.time.isAfter(thisMonth) && e.time.isBefore(nextMonth))
            .toList();
      case TimeRange.oneYear:
        return widget.data
            .where((e) => e.time.isAfter(thisYear) && e.time.isBefore(nextYear))
            .toList();
      case TimeRange.all:
        return widget.data;
    }
  }
}

class _TimeRangeList extends StatelessWidget {
  const _TimeRangeList(
      {Key? key, required this.timeRange, required this.onChanged})
      : super(key: key);

  final TimeRange timeRange;
  final void Function(TimeRange) onChanged;

  Widget _button(TimeRange timeRange) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: this.timeRange == timeRange ? null : Colors.transparent),
        onPressed: () {
          onChanged(timeRange);
        },
        child: Text(timeRange.shortName()));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: TimeRange.values
          .map((timeRange) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: _button(timeRange),
              ))
          .toList(),
    );
  }
}

class PriceChartData {
  final DateTime time;
  final num price;

  PriceChartData({required this.time, required this.price});
}

enum TimeRange {
  oneDay,
  oneWeek,
  oneMonth,
  oneYear,
  all,
}

extension ShortName on TimeRange {
  String shortName() {
    switch (this) {
      case TimeRange.oneDay:
        return '1D';
      case TimeRange.oneWeek:
        return '1W';
      case TimeRange.oneMonth:
        return '1M';
      case TimeRange.oneYear:
        return '1Y';
      case TimeRange.all:
        return 'All';
    }
  }
}
