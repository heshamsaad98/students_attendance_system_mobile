import 'package:flutter/material.dart';
import '../components/custom_pie_chart.dart';

class AttendanceSummaryReportsScreen extends StatelessWidget {
  AttendanceSummaryReportsScreen({Key? key}) : super(key: key);

  final Map<String, double> attendanceDataMap = {
    'Attendance': 5,
    'Absence': 3,
  };

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomPieChart(
      dataMap: attendanceDataMap,
    ));
  }
}
