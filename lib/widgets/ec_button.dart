import 'package:flutter/material.dart';

import '../configs/theme_config.dart';

class ECButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final Color? color;
  final Color? sideColor;
  final double? height;
  final double? width;
  final bool? borderColorHas;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient; // Add a gradient property

  const ECButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.height,
    this.width,
    this.color,
    this.sideColor,
    this.borderColorHas,
    this.boxShadow,
    this.gradient, // Initialize gradient property
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 48.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: gradient ?? // Use the provided gradient or a default
            LinearGradient(
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
              colors: [
                const Color(0xFF0A6C5F).withOpacity(0.29),
                ThemeColor.buttonColor,
              ],
              stops: const [0.001, 0.2],
            ),
      ),
      child: MaterialButton(
        minWidth: width ?? MediaQuery.of(context).size.width,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: sideColor ?? color ?? ThemeColor.buttonColor),
        ),
        color: gradient == null ? color : color,
        onPressed: onPressed,
        textColor: Colors.white,
        child: child,
      ),
    );
  }
}
