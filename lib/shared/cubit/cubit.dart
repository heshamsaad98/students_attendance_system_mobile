import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:students_attendance_system_mobile/shared/cubit/states.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/register_attendance/register_attendance_screen.dart';
import '../../screens/report/screens/attendance_reports_details_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<GButton> bottomItems = [
    const GButton(
      icon: LineIcons.home,
      text: 'Home',
    ),
    const GButton(
      icon: LineIcons.qrcode,
      text: 'Scan QR',
    ),
    const GButton(
      icon: LineIcons.clipboardWithCheck,
      text: 'Reports',
    ),
  ];

  List<Widget> screens = [
    const HomeScreen(),
    const RegisterAttendanceScreen(),
    const AttendanceReportsDetailsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(ChangePasswordVisibilityState());
  }
}
