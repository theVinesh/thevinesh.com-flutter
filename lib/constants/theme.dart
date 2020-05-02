import 'package:flutter/material.dart';

class SiteTheme {
  static ThemeData get theme {
    final themeData = ThemeData.dark();
    final textTheme = themeData.primaryTextTheme.copyWith(
        button: TextStyle(fontSize: 16, color: Color(0xffffffff)),
        bodyText2: TextStyle(fontSize: 16, color: Color(0xff000000))
    );
    return themeData.copyWith(
        primaryColor: Color(0xffd50000),
        primaryColorLight: Color(0xffff5131),
        primaryColorDark: Color(0xff9b0000),
        accentColor: Color(0xfffafafa),
        scaffoldBackgroundColor: Color(0xffffffff),
        textTheme: textTheme
    );
  }
}
