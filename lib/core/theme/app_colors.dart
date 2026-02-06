import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ============ PRIMARY (Green - Healthcare Trust) ============
  static const Color primaryLight = Color(0xFF00D9A3);
  static const Color primaryDark = Color(0xFF00B887);
  static const Color primaryGlow = Color(0xFF10B981);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryLight, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ============ ACCENT (Blue - Professional Tech) ============
  static const Color accentLight = Color(0xFF3B82F6);
  static const Color accentDark = Color(0xFF2563EB);

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accentLight, accentDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ============ STATUS COLORS ============
  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFFD1FAE5);

  static const Color warning = Color(0xFFF59E0B);
  static const Color warningDark = Color(0xFFD97706);

  static const LinearGradient warningGradient = LinearGradient(
    colors: [Color(0xFFFBBF24), Color(0xFFF59E0B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color error = Color(0xFFEF4444);
  static const Color errorDark = Color(0xFFDC2626);

  static const LinearGradient errorGradient = LinearGradient(
    colors: [error, errorDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color info = Color(0xFF0EA5E9);
  static const Color infoLight = Color(0xFFDBEAFE);

  // Amber (Critical Orders)
  static const Color amber = Color(0xFFFBBF24);
  static const Color amberDark = Color(0xFFF59E0B);

  static const LinearGradient amberGradient = LinearGradient(
    colors: [amber, amberDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ============ LIGHT MODE ============
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceVariantLight = Color(0xFFF1F5F9);
  static const Color borderLight = Color(0xFFE2E8F0);

  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF64748B);
  static const Color textTertiaryLight = Color(0xFF94A3B8);

  // ============ DARK MODE ============
  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color surfaceDark = Color(0xFF1E293B);
  static const Color surfaceVariantDark = Color(0xFF334155);
  static const Color borderDark = Color(0xFF475569);

  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFFCBD5E1);
  static const Color textTertiaryDark = Color(0xFF94A3B8);

  // ============ GLASS MORPHISM ============
  static Color glassDark = const Color(0xFF1E293B).withValues(alpha: 0.8);
  static Color glassLight = const Color(0xFFFFFFFF).withValues(alpha: 0.8);

  // ============ SHADOWS ============
  static List<BoxShadow> softShadowLight = [
    BoxShadow(
      color: const Color(0xFF0F172A).withValues(alpha: 0.08),
      blurRadius: 24,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> softShadowDark = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.3),
      blurRadius: 24,
      offset: const Offset(0, 4),
    ),
  ];

  // ============ GRADIENT OVERLAYS ============
  static const LinearGradient shimmerGradient = LinearGradient(
    colors: [Color(0xFFE2E8F0), Color(0xFFF1F5F9), Color(0xFFE2E8F0)],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment(-1.0, 0.0),
    end: Alignment(1.0, 0.0),
  );
}
