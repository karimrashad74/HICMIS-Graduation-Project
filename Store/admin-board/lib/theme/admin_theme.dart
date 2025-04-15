import 'package:flutter/material.dart';

class AdminTheme {
  static const Color primaryColor = Color(0xFF4A6FA5);
  static const Color secondaryColor = Color(0xFF166088);
  static const Color accentColor = Color(0xFF4FC3F7);
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color cardColor = Colors.white;
  static const Color textColor = Color(0xFF212529);
  static const Color errorColor = Color(0xFFE63946);
  static const Color successColor = Color(0xFF2E7D32);

  static ThemeData get themeData {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        background: backgroundColor,
        error: errorColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      cardTheme: const CardTheme(
        color: cardColor,
        elevation: 2,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      appBarTheme:  AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme:  TextTheme(
        titleLarge: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(color: textColor, fontSize: 16),
        bodySmall: TextStyle(color: textColor, fontSize: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
    );
  }
}