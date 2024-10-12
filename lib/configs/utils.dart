import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';




var currencySymbol = "₹";

String editStringPercentage(String gstPrice) {
  gstPrice = "${removeLastChars(gstPrice, 3)} %";
  return gstPrice;
}

String fileSizeFormatDecimal1(double amount) {
  return NumberFormat("##,##,##0.00").format(amount);
}

String indianPriceFormatDecimal1(double amount) {
  return "₹ ${NumberFormat("##,##,##0.00").format(amount)}";
}

String indianPriceFormat(int amount) {
  return "₹${NumberFormat("##,##,##0").format(amount)}";
}

String removeLastChars(String str, int chars) {
  return str.substring(0, str.length - chars);
}

hideLoading(BuildContext context) {
  Navigator.pop(context);
}

void showSnackBar(
    {required BuildContext context,
    required String message,
    Color? backgroundColor,
    Duration? duration}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: backgroundColor ?? Colors.black87,
      content: Text(message),
    ),
  );
}

showSuccessSnackbar(String message, BuildContext context) {
  showSnackBar(
      backgroundColor: Colors.green, message: message, context: context);
}

showLoading(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Center(
      child: SizedBox(
        height: 50.0.h,
        width: 50.0.w,
        child: const FittedBox(
          child: CircularProgressIndicator(
            strokeWidth: 3,
          ),
        ),
      ),
    ),
    barrierDismissible: false,
  );
}

double getFileSize(File file) {
  int sizeInBytes = file.lengthSync();
  double sizeInMb = sizeInBytes / (1024 * 1024);
  return sizeInMb;
}

String getFileSizeFromPath(File files) {
  int sizeInBytes = files.lengthSync();
  const suffixes = ["B", "Kb", "Mb", "Gb", "Tb"];
  var i = (log(sizeInBytes) / log(1024)).floor();
  return "${(sizeInBytes / pow(1024, i)).toStringAsFixed(0)} ${suffixes[i]}";
}

handleApiError(errorMessage, BuildContext context) {
  showSnackBar(
      backgroundColor: Colors.redAccent,
      message: errorMessage,
      duration: const Duration(seconds: 3),
      context: context);
}

showWarning(message, BuildContext context) {
  showSnackBar(
    backgroundColor: Colors.blueAccent,
    message: message,
    context: context,
    duration: const Duration(seconds: 3),
  );
}

String findAge(String date) {
  DateTime dob = DateTime.parse(date);
  Duration dur = DateTime.now().difference(dob);
  String differenceInYears = (dur.inDays / 365).floor().toString();
  return differenceInYears;
}

showSuccessSnackBar(String message, BuildContext context) {
  showSnackBar(
      backgroundColor: Colors.green, message: message, context: context);
}

bool validateEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool validatePassword(String password) {
  return RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~?]).{8,}$')
      .hasMatch(password);
}

var currencyFormat = NumberFormat(
  "##,##,###",
  "en_US", // local US
);

exitApp() {
  if (Platform.isAndroid) {
    SystemNavigator.pop();
  } else if (Platform.isIOS) {
    exit(0);
  }
}
