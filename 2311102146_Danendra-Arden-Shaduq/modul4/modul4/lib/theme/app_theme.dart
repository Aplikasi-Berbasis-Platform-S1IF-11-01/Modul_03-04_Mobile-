import 'package:flutter/material.dart';

class AppColors {
  // Primary palette - deep midnight with electric accents
  static const Color background = Color(0xFF0A0E1A);
  static const Color surface = Color(0xFF141928);
  static const Color surfaceElevated = Color(0xFF1C2438);
  static const Color border = Color(0xFF252D42);

  static const Color primary = Color(0xFF4F8EF7);
  static const Color primaryLight = Color(0xFF7AAEFF);
  static const Color accent = Color(0xFF00E5B3);
  static const Color accentWarm = Color(0xFFFF6B6B);
  static const Color accentPurple = Color(0xFFB06EFF);
  static const Color accentYellow = Color(0xFFFFD166);

  static const Color textPrimary = Color(0xFFF0F4FF);
  static const Color textSecondary = Color(0xFF8B9EC7);
  static const Color textMuted = Color(0xFF4A5880);

  static const Color success = Color(0xFF00E5B3);
  static const Color danger = Color(0xFFFF4D6D);

  // Grid card gradients
  static const List<List<Color>> cardGradients = [
    [Color(0xFF4F8EF7), Color(0xFF7C3AED)],
    [Color(0xFF00E5B3), Color(0xFF0EA5E9)],
    [Color(0xFFFF6B6B), Color(0xFFFF9F43)],
    [Color(0xFFB06EFF), Color(0xFFFF6B6B)],
    [Color(0xFFFFD166), Color(0xFFFF6B6B)],
    [Color(0xFF0EA5E9), Color(0xFF00E5B3)],
  ];
}

class AppTheme {
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.accent,
          surface: AppColors.surface,
          background: AppColors.background,
        ),
        fontFamily: 'SF Pro Display',
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
          iconTheme: IconThemeData(color: AppColors.textPrimary),
        ),
        cardTheme: CardThemeData(
          color: AppColors.surface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.border, width: 1),
          ),
        ),
      );
}