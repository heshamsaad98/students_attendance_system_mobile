import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vibration/vibration.dart';
import '../../shared/components/custom_awesome_dialog.dart';
import '../../shared/cubit/cubit.dart';
import '../report/components/report_data.dart';

class RegisterAttendanceScreen extends StatefulWidget {
  const RegisterAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<RegisterAttendanceScreen> createState() =>
      _RegisterAttendanceScreenState();
}

class _RegisterAttendanceScreenState extends State<RegisterAttendanceScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? qrCode;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is ios
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          buildQrView(context),
          Positioned(
            top: 10.0,
            child: buildFlashControlButtons(),
          ),
        ],
      ),
    );
  }

  Widget buildFlashControlButtons() => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white24,
        ),
        child: IconButton(
          onPressed: () async {
            await controller?.toggleFlash();
            setState(() {});
          },
          icon: FutureBuilder<bool?>(
            future: controller?.getFlashStatus(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Icon(
                  snapshot.data! ? Icons.flash_on : Icons.flash_off,
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      );

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.greenAccent,
          borderRadius: 10.0,
          borderLength: 20.0,
          borderWidth: 10.0,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((qrCodeData) => setState(() {
          if (qrCode == null) {
            qrCode = qrCodeData;
            Vibration.vibrate(duration: 100);
            if (qrCode!.code!.contains('sas')) {
              customAwesomeDialog(
                context: context,
                title: 'Success',
                desc: 'Your attendance has been registered successfully.',
                btnOkText: 'Ok',
                dialogType: DialogType.SUCCES,
                btnOkOnPress: () {
                  if (reportData[0].courseName == 'Network 1') {
                    reportData[0].attendanceDays++;
                  }
                  AppCubit.get(context).changeBottomNavBar(2);
                },
              );
            } else {
              customAwesomeDialog(
                context: context,
                title: 'Sorry',
                desc:
                    'You cannot register your attendance using a code other than the one generated by the system.',
                btnOkText: 'Ok',
                dialogType: DialogType.ERROR,
                btnOkColor: Colors.red,
                btnOkOnPress: () {
                  AppCubit.get(context).changeBottomNavBar(0);
                },
              );
            }
          }
        }));
  }
}
