import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Token desain terpusat, disamakan dengan desain Figma/wireframe
/// agar hasil slicing konsisten dengan hasil desain UI/UX.
class AppColors {
  static const bg = Color(0xFFF2F4EE);
  static const surface = Color(0xFFFFFFFF);
  static const ink = Color(0xFF1F241F);
  static const inkSoft = Color(0xFF657065);
  static const inkFaint = Color(0xFF9AA398);
  static const primary = Color(0xFF2F5233);
  static const primaryDark = Color(0xFF213C25);
  static const primaryTint = Color(0xFFE4EBE1);
  static const rust = Color(0xFFA8503B);
  static const border = Color(0xFFE2E4DC);
  static const danger = Color(0xFFB3483A);
}

class AppTheme {
  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.bg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        surface: AppColors.surface,
      ),
    );

    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(base.textTheme).copyWith(
        titleLarge: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 15.5,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: AppColors.border),
        ),
      ),
    );
  }
}
