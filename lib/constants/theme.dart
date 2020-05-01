import 'package:flutter/material.dart';

class SiteTheme {
  static ThemeData get theme {
    final themeData = ThemeData.dark();

    return ThemeData.dark().copyWith(
      primaryColor: Colors.red[800],
      accentColor: Colors.white,
      buttonColor: Colors.grey[800],
      textSelectionColor: Colors.red[100],
      toggleableActiveColor: Colors.red[300],
      snackBarTheme: SnackBarThemeData(
        backgroundColor: themeData.dialogBackgroundColor,
        actionTextColor: Colors.red[300],
      ),
    );
  }
}
