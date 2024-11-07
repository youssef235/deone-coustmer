import 'package:flutter/material.dart';

class AppTextStyle {
  static const String fontName = 'madani';

  static TextTheme textThemeLight = const TextTheme(
    displayLarge: TextStyle(
        fontFamily: fontName,
        fontSize: 105,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5),
    displayMedium: TextStyle(
        fontFamily: fontName,
        fontSize: 66,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5),
    displaySmall: TextStyle(
        fontFamily: fontName, fontSize: 52, fontWeight: FontWeight.w400),
    headlineMedium: TextStyle(
        fontFamily: fontName,
        fontSize: 37,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    headlineSmall: TextStyle(
        fontFamily: fontName, fontSize: 26, fontWeight: FontWeight.w400),
    titleLarge: TextStyle(
        fontFamily: fontName,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15),
    titleMedium: TextStyle(
        fontFamily: fontName,
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    titleSmall: TextStyle(
        fontFamily: fontName,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1),
    bodyLarge: TextStyle(
        fontFamily: fontName,
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5),
    bodyMedium: TextStyle(
        fontFamily: fontName,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    labelLarge: TextStyle(
        fontFamily: fontName,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25),
    bodySmall: TextStyle(
        fontFamily: fontName,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4),
    labelSmall: TextStyle(
        fontFamily: fontName,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5),
  );
}
