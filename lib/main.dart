import 'package:flutter/material.dart';
import 'package:food_delivery/ui/splash_view.dart';
import 'dart:ui' as ui;

import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Stack(
          textDirection: ui.TextDirection.ltr,
          children: [
            MaterialApp(
              title: 'Food Delivery',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: true,
              ),
              home: const SplashView(),
            ),
          ],
        );
      },
    );
  }
}
