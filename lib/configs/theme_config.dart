import 'package:flutter/material.dart';

class ThemeColor {

  static Color mainLightColor = const Color(0xFF01B8C6);
  static Color mainDarkColor = const Color(0xFF029AA5);
  static Color textGreyColor = const Color(0xFF666666);
  static Color lightGreyColor = const Color(0xFFF1F0F0);
  static Color black = const Color(0xFF000000);

  static Color thickGreenTxt = const Color(0xFF12B76A);
  static Color thickGreen = const Color(0xFF2c6918);
  static Color appThemeColor = const Color(0xFF50933B);
  static Color lightGreenTxt = const Color(0xFFECFDF3);
  static Color appThemeLigthbg = const Color(0xFFD1FADF);
  static Color otpColor = const Color(0xFFE9F2E6);
  static Color themeLighColor = const Color(0xFFF8FFF6);
  static Color featureColor = const Color(0xFF98A2B3);
  static Color iconColor= const Color(0xFF6F7071);
  static Color tabTextColor = const Color(0xFF1D2939);
  static Color textColor = const Color(0xFF1D2939);
  static Color bgColor = const Color(0xFFF2F4F7);
  static Color resendColor = const Color(0xFFF04438);
  static Color blueTextColor = const Color(0xFF0BA5EC);
  static Color lightblueTextColor = const Color(0xFFF0F9FF);
  static Color dullRedColorBg = const Color(0xffffef3f2);
  static Color lightRedColor =  const Color(0xFFFEE4E2);
  static Color lightRedColor1 = const Color(0xFFF4C8C6);
  static Color yellowColor = const Color(0xFFF79009);
  static Color yellow = const Color(0xFFFFFAEB);
  static Color yellow100 = const Color(0xFFFEF0C7);
  static Color yellow200 = const Color(0xFFF1DFAE);
  static Color tabColor = const Color(0xFF344054);
  static Color grayTextColor = const Color(0xFF667085);
  static Color white = const Color(0xFFFFFFFF);
  static Color unSelectColor = const Color(0xFFD0D5DD);
  static Color summaryColor = const Color(0xFF475467);
  static Color tabBgColor = const Color(0xFF767680);
  static Color borderColor = const Color(0xFFEAECF0);
  static Color tfBGColor = const Color(0xFFF9FAFB);
  static Color buttonColor = const Color(0xFF50933B);
  static Color errorColor = const Color(0xFFFEE4E2);
  static Color warningColor = const Color(0xFFFEDF89);
  static Color thickblack = const Color(0xFF111111);
  static Color primaryGreenColor = const Color(0xff007C5A);
  static Color dateColor = const Color(0xff1E8016);
  static Color homeBlack = const Color(0xFF323643);
  static Color subTitle = const Color(0xFF707070);
  static Color hintColor = const Color(0xFFbabbbf);
  static Color blue = const Color(0xFF3277D8);
  static Color greenColor = const Color(0xFF1BC500);
  static Color blueBgColor = const Color(0xFF2C5BDC);
  static Color textFieldBackgroundColor = const Color(0xFFFAFAFA);
  static Color backgroundColor = const Color(0xffF2F2F2);
  static Color blueDotColor = const Color(0xFF2081FF);
  static Color greyDotColor = const Color(0xFFE0E0E0);
  static Color blueButtonColor = const Color(0xFF2081FF);
  static Color orange = const Color(0xFFF57C51);
  static Color dropDownArrowColor = const Color(0xFF424242);
  static Color homeProposalSentBg = const Color(0xFFFFF3DA);
  static Color homeCandidateLikeBg = const Color(0xFFDDEEFF);
  static Color borderColorSingleLine = const Color(0xFFE0E0E0);
  static Color progressBackColor = const Color(0xFFD5FCDA);
  static Color longTermBackColor = const Color(0xFFFFF3DA);
  static Color badgeColor = const Color(0xFFFF7C70);
  static Color statusAccept = const Color(0xFF189A75);
  static Color statusNotAccept = const Color(0xFFDB5251);
  static Color statusAcceptBg = const Color(0xFFD4FCD9);
  static Color statusNotAcceptBg = const Color(0xFFFFEEE2);
  static Color colorTextBody = const Color(0xff334F76);
  static Color progressBarColor = const Color(0xffED1C24);
  static Color progressBarBackColor = const Color(0xffF8A4A7);
  static Color bodyText2 = const Color(0xff939598);
  static Color colorTextPrimary = const Color(0xff001C43);
  static Color colorTextSecondary = const Color(0xff27AE60);
  static Color colorTextThird = const Color(0xff667B98);
  static Color darkBlue = const Color(0xff002354);
  static Color lightBlue = const Color(0xff00AEEF);
  static Color lightAccent = const Color(0xff2ca8e2);
  static Color darkAccent = const Color(0xff2ca8e2);
  static Color lightBG = Colors.white;
  static Color darkBG = const Color(0xff121212);
  static Color lightTextColor = Colors.black;
  static Color darkTextColor = Colors.white;
  static Color dividerColor = const Color(0xffF2F2F2);
  static Color bodyTextColor = const Color(0xff57585A);
  static Color headingTextColor = const Color(0xff080806);
  static Color drawerHeaderColor = const Color(0xff10498B);
  static Color darkBluePrimary = const Color(0xff04040a);
  static Color darkBluePrimary100 = const Color(0xff131234);
  static Color darkBluePrimary200 = const Color(0xff1e1d53);
  static Color darkBluePrimary300 = const Color(0xff252468);
  static Color lightBluePrimary = const Color(0xffe9e9f0);
  static Color lightBluePrimary100 = const Color(0xffbebdd2);
  static Color lightBluePrimary200 = const Color(0xff515086);

  static MaterialColor orangeThemeColor = const MaterialColor(
    0xFFF57C51,
    <int, Color>{
      50: Color(0xFFF57C51),
      100: Color(0xFFF57C51),
      200: Color(0xFFF57C51),
      300: Color(0xFFF57C51),
      400: Color(0xFFF57C51),
      500: Color(0xFFF57C51),
      600: Color(0xFFF57C51),
      700: Color(0xFFF57C51),
      800: Color(0xFFF57C51),
      900: Color(0xFFF57C51),
    },
  );
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
