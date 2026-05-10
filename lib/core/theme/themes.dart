import 'package:flutter/material.dart';

class AppColors {
  // Greens
  static const Color primary = Color(0xFF2E7D32);
  static const Color darkGreen = Color(0xFF1B5E20);
  static const Color deepGreen = Color(0xFF063B12);
  static const Color lightGreen = Color(0xFFE8F5E9);
  static const Color iconBgGreen = Color(0xFFEDF3ED);

  // Backgrounds & Surfaces
  static const Color background = Color(0xFFF4F7F1);
  static const Color surface = Colors.white;
  static const Color cardGrey = Color(0xFFEDF1E6);
  static const Color inputFill = Colors.white;

  // Accents
  static const Color accentBrown = Color(0xFFB57F4D);
  static const Color highlightBrown = Color(0xFF9E6D42);
  static const Color accentOrange = Color(0xFFFF9800);
  static const Color alertRed = Colors.red;

  // Text
  static const Color textPrimary = Color(0xFF1A1C19);
  static const Color textGrey = Color(0xFF7A8677);
  static const Color textWhite = Colors.white;
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Roboto',
    );
  }
}