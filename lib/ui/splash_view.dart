import 'package:flutter/material.dart';
import 'package:food_delivery/configs/theme_config.dart';

import '../configs/app_font.dart';
import '../configs/app_images.dart';
import 'cart_database.dart';
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
      () async {
        await CartDatabaseHelper().clearCart();
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
          height: 240,
          decoration: BoxDecoration(
              color: ThemeColor.white,
              borderRadius: const BorderRadius.all(Radius.circular(100))),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  AppImages.salad,
                  fit: BoxFit.cover,
                ),
                Text(
                  'Foodie',
                  style: AppFont.fontStyle(
                    color: ThemeColor.black,
                    fontWeight: FontWeight.w400,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
