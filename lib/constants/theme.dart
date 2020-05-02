import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SiteTheme {
  static const Color black = Color(0xff000000);

  static const Color white = Color(0xffffffff);

  static const Color red = Color(0xffd50000);

  static const Color redLight = Color(0xffff5131);

  static const Color redDark = Color(0xff9b0000);

  static const Color grey = Color(0xfffafafa);

  static const double baseFontSize = 18;

  static ThemeData get theme {
    final themeData = ThemeData.light();
    final baseTextStyle = GoogleFonts.getFont(
      "Oxygen Mono",
      textStyle: themeData.textTheme.bodyText2.copyWith(
        inherit: true,
        color: black,
        fontSize: baseFontSize,
      ),
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
      headline2: baseTextStyle.copyWith(
        fontSize: baseFontSize + 2,
      ),
      headline4: baseTextStyle.copyWith(
        fontSize: baseFontSize + 4,
      ),
      headline6: baseTextStyle.copyWith(
        fontSize: baseFontSize + 8,
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
