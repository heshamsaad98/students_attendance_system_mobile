class ReportModel {
  ReportModel({
    required this.courseName,
    required this.attendanceDays,
    required this.absenceDays,
  });

  final String courseName;
  int attendanceDays, absenceDays;
  bool selected = false;
}
