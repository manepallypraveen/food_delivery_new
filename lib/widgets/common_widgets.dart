import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../configs/app_font.dart';
import '../configs/theme_config.dart';
import '../prefs/pref_utils.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ec_button.dart';

import 'package:fluttertoast/fluttertoast.dart';

Widget widthSizedBox(double width) {
  return SizedBox(
    // width: width.w,
    width: width,
  );
}

Widget heightSizedBox(double height) {
  return SizedBox(
    // height: height.h,
    height: height,
  );
}

Widget commonDivider(
    {double? thickness,
    double? indent,
    double? endIndent,
    required Color color,
    double? height}) {
  return Divider(
    thickness: thickness,
    indent: indent,
    endIndent: endIndent,
    color: color,
    height: height,
  );
}

EdgeInsetsGeometry ltrb({
  double? left,
  double? top,
  double? right,
  double? bottom,
  double? all,
}) {
  return EdgeInsets.fromLTRB(
    left ?? 0.0,
    top ?? 0.0,
    right ?? 0.0,
    bottom ?? 0.0,
  );
}

showSessionDialog(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => Dialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
              child: Text('Something went wrong',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: ThemeColor.grayTextColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 17.0,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text('Please try login again',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: ThemeColor.grayTextColor,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0)),
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Color(0xffDCDCDC),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Center(
                      child: Text('OK',
                          style: TextStyle(
                              color: Color(0xff1B79EB),
                              fontWeight: FontWeight.w500,
                              fontSize: 17.0)),
                    )),
              ],
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    ),
  );
}

Widget logoutAlert(
  BuildContext context,
) {
  return Dialog(
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0))),
    alignment: Alignment.center,
    insetPadding: const EdgeInsets.all(16),
    child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: ltrb(top: 16, bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            heightSizedBox(5),
            Padding(
              padding: ltrb(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "logOut",
                    style: AppFont.fontStyle(
                      size: 20,
                      fontWeight: FontWeight.w600,
                      color: ThemeColor.textColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                    },
                    icon: const Icon(
                      Icons.camera,
                      size: 10,
                    ),
                  ),
                ],
              ),
            ),
            heightSizedBox(8),
            commonDivider(
              thickness: 1.0,
              indent: 0,
              endIndent: 0,
              color: ThemeColor.borderColor,
              height: 1,
            ),
            heightSizedBox(16),
            commonDivider(
              thickness: 1.0,
              indent: 0,
              endIndent: 0,
              color: ThemeColor.borderColor,
              height: 1,
            ),
            heightSizedBox(8),
            Padding(
              padding: ltrb(left: 16, right: 16),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 38,
                    child: ECButton(
                      height: 48,
                      color: ThemeColor.resendColor,
                      onPressed: () {
                        PrefUtils.clearPrefs();
                      },
                      child: Text(
                        " S.current.logOut",
                        style: AppFont.fontStyle(
                            color: ThemeColor.white,
                            size: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  widthSizedBox(10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 38,
                    child: ECButton(
                      height: 48,
                      color: ThemeColor.white,
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                      },
                      child: Text(
                        'Cancel',
                        style: AppFont.fontStyle(
                            color: ThemeColor.textColor,
                            size: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            heightSizedBox(4),
          ],
        ),
      ),
    ),
  );
}

Future<bool?> exitConfirmation(BuildContext context) async {
  return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Dialog(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            alignment: Alignment.center,
            insetPadding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    heightSizedBox(5),
                    const Icon(
                      Icons.camera,
                      size: 40,
                    ),
                    Text(
                      'Exit App',
                      style: AppFont.fontStyle(
                        size: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: ThemeColor.black,
                      ),
                    ),
                    heightSizedBox(8),
                    Text(
                      'Do you really want to exit the app?',
                      textAlign: TextAlign.center,
                      style: AppFont.fontStyle(
                        size: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: ThemeColor.black,
                      ),
                    ),
                    heightSizedBox(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 38.w,
                          child: ECButton(
                            height: 48,
                            color: ThemeColor.lightBluePrimary,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancel',
                              style: AppFont.fontStyle(
                                size: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: ThemeColor.black,
                              ),
                            ),
                          ),
                        ),
                        widthSizedBox(10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 38.w,
                          child: ECButton(
                            height: 48,
                            color: ThemeColor.darkBluePrimary300,
                            onPressed: () {
                              PrefUtils.clearPrefs();
                              SystemNavigator.pop();
                              Navigator.pop(context);
                              // exitApp();
                            },
                            child: Text(
                              'Yes',
                              style: AppFont.fontStyle(
                                size: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: ThemeColor.black,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    heightSizedBox(4),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

Widget progressDialog(BuildContext context) {
  return Dialog(
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    alignment: Alignment.center,
    child: SizedBox(
      // width: 180,  // Set the desired width here
      height: 180, // Set the desired height here
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          heightSizedBox(5),
          // Lottie.asset(
          //   'assets/images/green_loading.json',
          //   width: 120,
          //   height: 120,
          // ),
          Text(
            'Please wait...',
            style: AppFont.fontStyle(
              color: ThemeColor.tabTextColor,
              fontWeight: FontWeight.w400,
              size: 16,
            ),
          ),
          heightSizedBox(24)
        ],
      ),
    ),
  );
}

Widget successProgressDialog(BuildContext context, String image, String text) {
  return Dialog(
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0))),
    alignment: Alignment.center,
    insetPadding: const EdgeInsets.all(16),
    child: SizedBox(
      // width: MediaQuery.sizeOf(context).width / 2,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            heightSizedBox(5),
            // Lottie.asset(
            //   image,
            //   width: 80,
            //   height: 80,
            // ),
            heightSizedBox(14),
            Text(
              text,
              style: AppFont.fontStyle(
                color: ThemeColor.black,
                size: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            heightSizedBox(15),
          ],
        ),
      ),
    ),
  );
}

void showSnackBar(
    {required BuildContext context,
    required String message,
    Color? backgroundColor,
    Duration? duration}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: duration ?? const Duration(seconds: 2),
      backgroundColor: backgroundColor ?? Colors.black87,
      content: Text(message),
    ),
  );
}

void flutterToast(String message, Color color) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}


class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

Widget willPopScopeWidget(final Widget child, final Function() onWillPop) {
  return WillPopScope(
    onWillPop: () async {
      onWillPop();
      return true;
    },
    child: child,
  );
}
