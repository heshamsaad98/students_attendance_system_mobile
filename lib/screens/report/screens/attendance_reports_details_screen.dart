import 'package:flutter/material.dart';
import '../../../shared/components/custom_report.dart';
import '../components/report_data.dart';

class AttendanceReportsDetailsScreen extends StatelessWidget {
  const AttendanceReportsDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => CustomReport(
          reportData: reportData[index],
        ),
        itemCount: reportData.length,
      ),
    );
  }
}
