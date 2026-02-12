import 'package:flutter/material.dart';

class AppTheme {
  static const Color _lightPrimaryColor = Color(0xFFc3662c);
  static const Color _lightPrimaryVariantColor = Colors.white;
  static const Color _ligthBackgroundColor = Colors.white;
  static const Color _lightTextColor = Colors.black;
  static const Color _lightIconButtonColor = Color(0xFF766A60);

  static const Color _darkPrimaryColor = Color(0xFFc3662c);
  static const Color _darkPrimaryVariantColor = Color(0xFFffab40);
  static const Color _darkBackgroundColor = Color(0xFF1a1a1a);
  static const Color _darkTextColor = Colors.white;
  static const Color _darkIconButtonColor = Color(0xFF766A60);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      onPrimary: _lightPrimaryVariantColor,
      secondary: _ligthBackgroundColor,
      onSecondary: _lightTextColor,
    ),
    scaffoldBackgroundColor: _ligthBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: _lightTextColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _lightPrimaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(foregroundColor: _lightIconButtonColor),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      onPrimary: _darkPrimaryVariantColor,
      secondary: _darkBackgroundColor,
      onSecondary: _darkTextColor,
    ),
    scaffoldBackgroundColor: _darkBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: _darkTextColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _darkPrimaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(foregroundColor: _darkIconButtonColor),
    ),
  );
}
