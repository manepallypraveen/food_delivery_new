import 'package:flutter/material.dart';
import 'package:food_delivery/configs/theme_config.dart';

import 'dashboard_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardView()),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
              color: ThemeColor.mainLightColor,
              borderRadius: const BorderRadius.all(Radius.circular(100))),
        ),
      ),
    );
  }
}
