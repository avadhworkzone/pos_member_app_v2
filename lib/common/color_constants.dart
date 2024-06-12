import 'package:flutter/material.dart';

class ColorConstants {
  static const Color cBlack = Colors.black;
  static const Color cWhite = Colors.white;
  static const Color primaryColor = cBlack;
  static const Color primaryColorDark = cBlack;
  static const Color accentColor = Colors.blue;
  static const Color cOrangeButton = Colors.red;
  static const Color cError = Color(0xffEF3F3F);
  static const Color cSuccess = Color(0xff3AB549);
  static const Color backgroundColor = Color(0xFFFAFAFA);
  static const Color scaffoldBackgroundColor = Colors.white;
  static const Color cDividerColor = Color(0xffd0d5dd);
  static const Color cDividerMoreLightColor = Color(0xffF1F1F1);
  static const Color cDividerLightColor = Color(0xffBBBBBB);
  static const Color cEditTextBorderLightColor = Color(0xffDDDDDD);
  static const Color cHintText = Color(0xFF78909C);
  static const Color cScaffoldBackgroundColor = Color(0xffFFFFFF);
  static const Color cBottomNavigationBarColor = Color(0xffe5e5e5);
  static const Color cRedColor = Color(0xffFF0E0E);
  static const Color cLightRedColor = Color(0xffFFECEC);
  static const Color cGreenColor = Color(0xff23D760);
  static const Color cLightGreenColor = Color(0xffE7FFEE);
  static const Color cPrimaryTextColor = Color(0xff475467);
  static const Color cDarkTextColor = Color(0xff475467);
  static const Color cSearchBarColor = Color(0xfff2f4f7);
  static const Color cNavyBlueColor = Color(0xff1d2939);
  static const Color cTextColor = Color(0xff344054);
  static const Color cPinkTextColor = Color(0xffB32572);
  static const Color cLightGreyTextColor = Color(0xff667085);
  static const Color cGrayColor = Color(0xff667085);

  /// app Theme Color
  static const MaterialColor kPrimaryColor = MaterialColor(
    _cActionBar,
    <int, Color>{
      50: Color(0xFFFCF3F9),
      100: Color(0xFFFAE9F5),
      200: Color(0xFFF8d2ed),
      300: Color(0xFFf3aedc),
      400: Color(0xFFea7cc4),
      500: Color(0xffdf55aa),
      600: Color(0xFFcd358c),
      700: Color(0xFFb32572),
      800: Color(0xFF7b2051),
      900: Color(0xFF4a0d2d),
    },
  );
  static const int _cActionBar = 0xFFAA336A;
}
