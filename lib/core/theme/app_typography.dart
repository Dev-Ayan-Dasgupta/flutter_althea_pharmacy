import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  AppTypography._();

  // Base Baloo Bhaijaan 2 text style
  static TextStyle get _baseTextStyle => GoogleFonts.balooBhaijaan2();

  // ============ DISPLAY (Hero text) ============
  static TextStyle displayLarge(Color color) => _baseTextStyle.copyWith(
    fontSize: 57,
    fontWeight: FontWeight.w700,
    color: color,
  );

  static TextStyle displayMedium(Color color) => _baseTextStyle.copyWith(
    fontSize: 45,
    fontWeight: FontWeight.w700,
    color: color,
  );

  static TextStyle displaySmall(Color color) => _baseTextStyle.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: color,
  );

  // ============ HEADLINE (Screen titles) ============
  static TextStyle headlineLarge(Color color) => _baseTextStyle.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: color,
  );

  static TextStyle headlineMedium(Color color) => _baseTextStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: color,
  );

  static TextStyle headlineSmall(Color color) => _baseTextStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: color,
  );

  // ============ TITLE (Card headers, sections) ============
  static TextStyle titleLarge(Color color) => _baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: color,
  );

  static TextStyle titleMedium(Color color) => _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: color,
  );

  static TextStyle titleSmall(Color color) => _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: color,
  );

  // ============ BODY (Content text) ============
  static TextStyle bodyLarge(Color color) => _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: color,
  );

  static TextStyle bodyMedium(Color color) => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: color,
  );

  static TextStyle bodySmall(Color color) => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: color,
  );

  // ============ LABEL (Buttons, chips) ============
  static TextStyle labelLarge(Color color) => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: color,
  );

  static TextStyle labelMedium(Color color) => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: color,
  );

  static TextStyle labelSmall(Color color) => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: color,
  );

  // ============ SPECIAL (Numbers, metrics) ============
  static TextStyle metric(Color color) => _baseTextStyle.copyWith(
    fontSize: 48,
    fontWeight: FontWeight.w800,
    color: color,
  );

  static TextStyle caption(Color color) => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: color,
  );
}
