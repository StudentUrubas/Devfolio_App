import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const background = Color(0xFF09111E);
  static const sidebar = Color(0xFF0D1725);
  static const surface = Color(0xFF111E2F);
  static const surfaceLight = Color(0xFF17263B);
  static const outline = Color(0xFF26364A);
  static const foreground = Color(0xFFF3F7FB);
  static const muted = Color(0xFF94A7BA);
  static const accent = Color(0xFFB5F5D0);
  static const blue = Color(0xFF9EC9FF);
  static const amber = Color(0xFFFFD29A);
  static const purple = Color(0xFFC8B9FF);
}

class AppTheme {
  const AppTheme._();

  static ThemeData get dark {
    final base = ThemeData.dark(useMaterial3: true);

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accent,
        onPrimary: AppColors.background,
        secondary: AppColors.blue,
        surface: AppColors.surface,
        onSurface: AppColors.foreground,
      ),
      textTheme: base.textTheme.apply(
        bodyColor: AppColors.foreground,
        displayColor: AppColors.foreground,
      ),
      splashColor: AppColors.accent.withAlpha(20),
      dividerColor: AppColors.outline,
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.surfaceLight,
        contentTextStyle: TextStyle(color: AppColors.foreground),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
