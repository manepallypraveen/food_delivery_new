import 'package:flutter/material.dart';
import 'package:food_delivery/configs/theme_config.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont {

  static TextStyle fontStyle(
      {double? size,
        Color? color,
        double? letterSpacing,
        FontWeight? fontWeight,
        FontStyle? fontStyle,
        bool? underline}) {
    return GoogleFonts.jost(
      fontSize: size ?? 14,
      decoration: underline == true ? TextDecoration.underline : null,
      fontStyle: fontStyle,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? ThemeColor.black,
      letterSpacing: letterSpacing ?? 0.0,
    );
  }

}
