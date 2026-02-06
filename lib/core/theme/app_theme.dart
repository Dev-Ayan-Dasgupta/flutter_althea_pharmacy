import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  AppTheme._();

  // ============ LIGHT THEME ============
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // Colors
    scaffoldBackgroundColor: AppColors.backgroundLight,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryDark,
      secondary: AppColors.accentDark,
      surface: AppColors.surfaceLight,
      error: AppColors.error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.textPrimaryLight,
      onError: Colors.white,
    ),

    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfaceLight,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      iconTheme: const IconThemeData(color: AppColors.textPrimaryLight),
      titleTextStyle: AppTypography.titleLarge(AppColors.textPrimaryLight),
    ),

    // Card
    cardTheme: CardThemeData(
      color: AppColors.surfaceLight,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.borderLight, width: 1),
      ),
      shadowColor: AppColors.textPrimaryLight.withValues(alpha: 0.08),
    ),

    // Input
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceLight,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.borderLight, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.borderLight, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primaryDark, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
      hintStyle: AppTypography.bodyMedium(AppColors.textTertiaryLight),
      labelStyle: AppTypography.bodyMedium(AppColors.textSecondaryLight),
    ),

    // Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTypography.labelLarge(Colors.white),
      ),
    ),

    // Text Button
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryDark,
        textStyle: AppTypography.labelLarge(AppColors.primaryDark),
      ),
    ),

    // Floating Action Button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: Colors.white,
      elevation: 4,
    ),

    // Divider
    dividerTheme: const DividerThemeData(
      color: AppColors.borderLight,
      thickness: 1,
      space: 1,
    ),

    // Text Theme
    textTheme: TextTheme(
      displayLarge: AppTypography.displayLarge(AppColors.textPrimaryLight),
      displayMedium: AppTypography.displayMedium(AppColors.textPrimaryLight),
      displaySmall: AppTypography.displaySmall(AppColors.textPrimaryLight),
      headlineLarge: AppTypography.headlineLarge(AppColors.textPrimaryLight),
      headlineMedium: AppTypography.headlineMedium(AppColors.textPrimaryLight),
      headlineSmall: AppTypography.headlineSmall(AppColors.textPrimaryLight),
      titleLarge: AppTypography.titleLarge(AppColors.textPrimaryLight),
      titleMedium: AppTypography.titleMedium(AppColors.textPrimaryLight),
      titleSmall: AppTypography.titleSmall(AppColors.textPrimaryLight),
      bodyLarge: AppTypography.bodyLarge(AppColors.textPrimaryLight),
      bodyMedium: AppTypography.bodyMedium(AppColors.textPrimaryLight),
      bodySmall: AppTypography.bodySmall(AppColors.textPrimaryLight),
      labelLarge: AppTypography.labelLarge(AppColors.textPrimaryLight),
      labelMedium: AppTypography.labelMedium(AppColors.textPrimaryLight),
      labelSmall: AppTypography.labelSmall(AppColors.textPrimaryLight),
    ),
  );

  // ============ DARK THEME ============
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // Colors
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryLight,
      secondary: AppColors.accentLight,
      surface: AppColors.surfaceDark,
      error: AppColors.error,
      onPrimary: AppColors.backgroundDark,
      onSecondary: AppColors.backgroundDark,
      onSurface: AppColors.textPrimaryDark,
      onError: Colors.white,
    ),

    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: const IconThemeData(color: AppColors.textPrimaryDark),
      titleTextStyle: AppTypography.titleLarge(AppColors.textPrimaryDark),
    ),

    // Card
    cardTheme: CardThemeData(
      color: AppColors.surfaceDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.borderDark, width: 1),
      ),
      shadowColor: Colors.black.withValues(alpha: 0.3),
    ),

    // Input
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceVariantDark,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.borderDark, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.borderDark, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primaryLight, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
      hintStyle: AppTypography.bodyMedium(AppColors.textTertiaryDark),
      labelStyle: AppTypography.bodyMedium(AppColors.textSecondaryDark),
    ),

    // Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.backgroundDark,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTypography.labelLarge(AppColors.backgroundDark),
      ),
    ),

    // Text Button
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryLight,
        textStyle: AppTypography.labelLarge(AppColors.primaryLight),
      ),
    ),

    // Floating Action Button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: AppColors.backgroundDark,
      elevation: 4,
    ),

    // Divider
    dividerTheme: const DividerThemeData(
      color: AppColors.borderDark,
      thickness: 1,
      space: 1,
    ),

    // Text Theme
    textTheme: TextTheme(
      displayLarge: AppTypography.displayLarge(AppColors.textPrimaryDark),
      displayMedium: AppTypography.displayMedium(AppColors.textPrimaryDark),
      displaySmall: AppTypography.displaySmall(AppColors.textPrimaryDark),
      headlineLarge: AppTypography.headlineLarge(AppColors.textPrimaryDark),
      headlineMedium: AppTypography.headlineMedium(AppColors.textPrimaryDark),
      headlineSmall: AppTypography.headlineSmall(AppColors.textPrimaryDark),
      titleLarge: AppTypography.titleLarge(AppColors.textPrimaryDark),
      titleMedium: AppTypography.titleMedium(AppColors.textPrimaryDark),
      titleSmall: AppTypography.titleSmall(AppColors.textPrimaryDark),
      bodyLarge: AppTypography.bodyLarge(AppColors.textPrimaryDark),
      bodyMedium: AppTypography.bodyMedium(AppColors.textPrimaryDark),
      bodySmall: AppTypography.bodySmall(AppColors.textPrimaryDark),
      labelLarge: AppTypography.labelLarge(AppColors.textPrimaryDark),
      labelMedium: AppTypography.labelMedium(AppColors.textPrimaryDark),
      labelSmall: AppTypography.labelSmall(AppColors.textPrimaryDark),
    ),
  );
}
