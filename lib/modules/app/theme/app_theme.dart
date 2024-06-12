import 'package:flutter/material.dart';
import 'package:member_app_v2/common/color_constants.dart';

ThemeData appLightTheme(BuildContext context) {
  return ThemeData(
      scrollbarTheme: ScrollbarThemeData().copyWith(
        thumbColor:
            MaterialStateProperty.all(ColorConstants.kPrimaryColor.shade600),
      ),
      fontFamily: 'PlusJakartaSans',
      scaffoldBackgroundColor: ColorConstants.cScaffoldBackgroundColor,
      primarySwatch: ColorConstants.kPrimaryColor,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        color: ColorConstants.kPrimaryColor, //<-- SEE HERE
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade200,
        isDense: true,
        border: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Colors.grey.shade300), //<-- SEE HERE
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Colors.grey.shade300), //<-- SEE HERE
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Colors.grey.shade300), //<-- SEE HERE
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return ColorConstants.kPrimaryColor;
          }
          return Colors.white;
        }),
        checkColor: MaterialStateProperty.all(Colors.white),
      ),
      dividerTheme:
          const DividerThemeData(color: ColorConstants.cDividerColor));
}

ThemeData appDarkTheme(BuildContext context) {
  return ThemeData(
      fontFamily: 'PlusJakartaSans',
      scrollbarTheme: ScrollbarThemeData().copyWith(
        thumbColor:
            MaterialStateProperty.all(ColorConstants.kPrimaryColor.shade600),
      ),
      scaffoldBackgroundColor: ColorConstants.cScaffoldBackgroundColor,
      primarySwatch: ColorConstants.kPrimaryColor,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        color: ColorConstants.kPrimaryColor, //<-- SEE HERE
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade200,
        isDense: true,
        border: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Colors.grey.shade300), //<-- SEE HERE
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Colors.grey.shade300), //<-- SEE HERE
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Colors.grey.shade300), //<-- SEE HERE
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return ColorConstants.kPrimaryColor;
          }
          return Colors.white;
        }),
        checkColor: MaterialStateProperty.all(Colors.white),
      ),
      dividerTheme:
          const DividerThemeData(color: ColorConstants.cDividerColor));
}
