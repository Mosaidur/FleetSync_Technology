import 'package:flutter/material.dart';

class AppColors {
  static const Color buttonPrimary = Color(0xFF00A430);
  static const Color primaryTextOnDark = Color(0xFFFFFFFE);
  static const Color primaryTextOnLight = Colors.black;
  static const Color secondaryText = Color(0xFF757575); // light grey tone
  static const Color themeRed = Color(0xFFFC3D03);
  static const Color themeYellow = Color(0xFFFCAD03);
  static const Color themeGreen = Color(0xFF00A430);
  static const Color backgroundLight = Colors.white;
  static const Color backgroundDark = Colors.black;
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.themeGreen,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.primaryTextOnLight),
      bodyMedium: TextStyle(color: AppColors.secondaryText),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonPrimary,
        foregroundColor: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      foregroundColor: AppColors.primaryTextOnLight,
      elevation: 0,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.backgroundDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.primaryTextOnDark),
      bodyMedium: TextStyle(color: AppColors.secondaryText),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonPrimary,
        foregroundColor: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      foregroundColor: AppColors.primaryTextOnDark,
      elevation: 0,
    ),
  );
}
