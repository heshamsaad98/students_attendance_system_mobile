import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

Future<dynamic> customAwesomeDialog({
  required BuildContext context,
  DialogType dialogType = DialogType.WARNING,
  String? title,
  String? desc,
  double? width = 500.0,
  bool showCloseIcon = false,
  Color? btnOkColor,
  bool dismissOnTouchOutside = false,
  dynamic Function()? btnOkOnPress,
  String? btnCancelText,
  String? btnOkText,
  dynamic Function()? btnCancelOnPress,
}) {
  return AwesomeDialog(
    context: context,
    dialogType: dialogType,
    dismissOnTouchOutside: dismissOnTouchOutside,
    title: title,
    desc: desc,
    width: width,
    btnOkColor: btnOkColor,
    btnOkText: btnOkText,
    btnOkOnPress: btnOkOnPress,
    btnCancelText: btnCancelText,
    showCloseIcon: showCloseIcon,
    btnCancelOnPress: btnCancelOnPress,
  ).show();
}
