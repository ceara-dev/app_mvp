import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF3288F8), // #3288F8
    scaffoldBackgroundColor: const Color(0xFFE7EDF0), // #e7edf0
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF3288F8), // #3288F8
      secondary: Color.fromRGBO(139, 182, 104, 1), // #8bb668
      surface: Color(0xFFE7EDF0), // #e7edf0
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF3288F8), // #3288F8
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF8BB668), // #8bb668
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Color(0xFF80A9C5),
      ), // #80a9c5
      bodyLarge: TextStyle(
        color: Color(0xFF747491),
      ), // #747491
      bodyMedium: TextStyle(
        color: Color(0xFF747491),
      ),
      bodySmall: TextStyle(
        color: Color(0xFF3288F8)
      ) // #747491
    ),
  );
}
