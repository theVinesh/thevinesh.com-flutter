import 'package:flutter/material.dart';

class SiteTheme {
  static Color get black => Color(0xff000000);

  static Color get white => Color(0xffffffff);

  static Color get red => Color(0xffd50000);

  static Color get redLight => Color(0xffff5131);

  static Color get redDark => Color(0xff9b0000);

  static Color get grey => Color(0xfffafafa);

  static double get baseFontSize => 18;

  static ThemeData get theme {
    final themeData = ThemeData.light();
    final baseTextStyle = themeData.textTheme.bodyText2.copyWith(
      inherit: true,
      color: black,
      fontSize: baseFontSize,
    );
    final textTheme = themeData.textTheme.copyWith(
      button: baseTextStyle.copyWith(color: white),
      bodyText1: baseTextStyle.copyWith(fontSize: baseFontSize - 2),
      bodyText2: baseTextStyle,
      caption: baseTextStyle.copyWith(
        fontSize: baseFontSize - 4,
        color: redLight,
        fontWeight: FontWeight.bold,
      ),
    );
    return themeData.copyWith(
      primaryColor: red,
      primaryColorLight: redLight,
      primaryColorDark: redDark,
      accentColor: grey,
      scaffoldBackgroundColor: grey,
      textTheme: textTheme,
    );
  }
}
