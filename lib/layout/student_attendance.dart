import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../screens/login/login_screen.dart';
import '../screens/report/screens/attendance_reports_details_screen.dart';
import '../screens/report/screens/attendance_summary_reports_screen.dart';
import '../shared/components/custom_awesome_dialog.dart';
import '../shared/components/navigate_and_finish.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class StudentAttendance extends StatelessWidget {
  const StudentAttendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: cubit.currentIndex == 1
                  ? null
                  : AppBar(
                      title: cubit.currentIndex == 0
                          ? const Text(
                              'SAS App',
                            )
                          : const Text(
                              'Attendance reports',
                            ),
                      automaticallyImplyLeading: false,
                      actions: [
                        if (cubit.currentIndex == 2)
                          IconButton(
                            onPressed: () {
                              customAwesomeDialog(
                                context: context,
                                title: 'Logout',
                                desc: 'Do you want to logout already?',
                                btnOkText: 'Yes',
                                dialogType: DialogType.QUESTION,
                                btnOkOnPress: () {
                                  navigateAndFinish(
                                    context,
                                    const LoginScreen(),
                                  );
                                },
                                btnCancelText: 'No',
                                btnCancelOnPress: () {},
                              );
                            },
                            icon: const Icon(
                              Icons.logout,
                            ),
                          ),
                      ],
                      bottom: cubit.currentIndex == 2
                          ? TabBar(
                              tabs: [
                                createTab(
                                  icon: LineIcons.scroll,
                                ),
                                createTab(
                                  icon: LineIcons.pieChart,
                                ),
                              ],
                              labelPadding: const EdgeInsets.all(0),
                            )
                          : null,
                    ),
              body: cubit.currentIndex != 2
                  ? cubit.screens[cubit.currentIndex]
                  : TabBarView(
                      children: [
                        const AttendanceReportsDetailsScreen(),
                        AttendanceSummaryReportsScreen(),
                      ],
                    ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      color: Colors.black.withOpacity(.1),
                    )
                  ],
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8),
                    child: GNav(
                      rippleColor: Colors.grey[300]!,
                      hoverColor: Colors.grey[100]!,
                      gap: 8,
                      iconSize: 24,
                      activeColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      duration: const Duration(
                        milliseconds: 400,
                      ),
                      tabBackgroundColor: Colors.grey[100]!,
                      color: Colors.black,
                      tabs: cubit.bottomItems,
                      selectedIndex: cubit.currentIndex,
                      onTabChange: (index) {
                        cubit.changeBottomNavBar(index);
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget createTab({
    required IconData? icon,
    Color? iconColor = Colors.black,
    Color? dividerColor = Colors.grey,
  }) {
    return Tab(
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: dividerColor!,
              ),
            ),
          ),
          child: Center(
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
        )),
      ]),
    );
  }
}
