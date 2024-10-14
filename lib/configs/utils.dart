import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/configs/theme_config.dart';
import 'package:intl/intl.dart';
import 'app_font.dart';
import 'app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

Future<void> customSnackBar(BuildContext context, String price) async {
  snackbarEvent('24 min', '\$${price}', context);
}

snackbarEvent(time, price, BuildContext context) {
  showSnackBarClickEvent(
      backgroundColor: Colors.black,
      time: time,
      price: price,
      duration: const Duration(seconds: 2),
      context: context);
}

void showSnackBarClickEvent(
    {required BuildContext context,
    required String time,
    required String price,
    Color? backgroundColor,
    Duration? duration}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: ThemeColor.black, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: backgroundColor ?? Colors.black87,
      content: InkWell(
        onTap: () {
          // _cartListBottomSheet();
        },
        child: SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Cart',
                style: AppFont.fontStyle(
                    fontWeight: FontWeight.w500,
                    color: ThemeColor.white,
                    size: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    time,
                    style: AppFont.fontStyle(
                        fontWeight: FontWeight.w500,
                        color: ThemeColor.white,
                        size: 12),
                  ),
                  SvgPicture.asset(
                    AppImages.dot,
                    color: ThemeColor.white,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    price,
                    style: AppFont.fontStyle(
                        fontWeight: FontWeight.w500,
                        color: ThemeColor.white,
                        size: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
