import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ============ PRIMARY (Softer Green) ============
  static const Color primaryLight = Color(0xFF4ADE80); // Softer green
  static const Color primaryDark = Color(0xFF22C55E);
  static const Color primaryGlow = Color(0xFF86EFAC);

  static LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF6EE7B7).withValues(alpha: 0.2),
      Color(0xFF3B82F6).withValues(alpha: 0.2),
    ], // Mint to soft blue
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Subtle variant for cards
  static LinearGradient primaryGradientSubtle = LinearGradient(
    colors: [
      Color(0xFFE0F2FE).withValues(alpha: 0.2),
      Color(0xFFDCFCE7).withValues(alpha: 0.2),
    ], // Very light blue to light green
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient primaryGradientSubtleDark = LinearGradient(
    colors: [
      Color(0xFF1E3A5F).withValues(alpha: 0.2),
      Color(0xFF1E4D3F).withValues(alpha: 0.2),
    ], // Dark blue to dark green
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ============ ACCENT (Softer Blue) ============
  static const Color accentLight = Color(0xFF60A5FA); // Softer blue
  static const Color accentDark = Color(0xFF3B82F6);

  static LinearGradient accentGradient = LinearGradient(
    colors: [
      Color(0xFF93C5FD).withValues(alpha: 0.2),
      Color(0xFF7DD3FC)..withValues(alpha: 0.2),
    ], // Light blue to sky
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient accentGradientSubtle = LinearGradient(
    colors: [
      Color(0xFFDCEEFF).withValues(alpha: 0.2),
      Color(0xFFE0F2FE).withValues(alpha: 0.2),
    ], // Very light blue shades
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ============ STATUS COLORS (Softer) ============
  static const Color success = Color(0xFF22C55E);
  static const Color successLight = Color(0xFFBBF7D0);

  static LinearGradient successGradient = LinearGradient(
    colors: [
      Color(0xFF86EFAC).withValues(alpha: 0.2),
      Color(0xFF6EE7B7).withValues(alpha: 0.2),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color warning = Color(0xFFFBBF24);
  static const Color warningDark = Color(0xFFF59E0B);

  static LinearGradient warningGradient = LinearGradient(
    colors: [
      Color(0xFFFDE68A).withValues(alpha: 0.2),
      Color(0xFFFBBF24).withValues(alpha: 0.2),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color error = Color(0xFFEF4444);
  static const Color errorDark = Color(0xFFDC2626);

  static LinearGradient errorGradient = LinearGradient(
    colors: [
      Color(0xFFFCA5A5).withValues(alpha: 0.2),
      Color(0xFFEF4444).withValues(alpha: 0.2),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color info = Color(0xFF3B82F6);
  static const Color infoLight = Color(0xFFDBEAFE);

  // Amber (Critical Orders) - Softer
  static const Color amber = Color(0xFFFBBF24);
  static const Color amberDark = Color(0xFFF59E0B);

  static LinearGradient amberGradient = LinearGradient(
    colors: [
      Color(0xFFFDE68A).withValues(alpha: 0.2),
      Color(0xFFFBBF24).withValues(alpha: 0.2),
    ],
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
      color: const Color(0xFF0F172A).withValues(alpha: 0.06),
      blurRadius: 20,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> softShadowDark = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.2),
      blurRadius: 20,
      offset: const Offset(4, 4),
    ),
  ];

  // ============ CARD GRADIENTS (Very Subtle) ============
  static LinearGradient cardGradientLight = const LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFF8FAFC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient cardGradientDark = const LinearGradient(
    colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ============ GRADIENT OVERLAYS ============
  static const LinearGradient shimmerGradient = LinearGradient(
    colors: [Color(0xFFE2E8F0), Color(0xFFF1F5F9), Color(0xFFE2E8F0)],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment(-1.0, 0.0),
    end: Alignment(1.0, 0.0),
  );
}
