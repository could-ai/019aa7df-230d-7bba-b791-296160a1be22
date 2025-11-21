import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // "Cute" & "Magical" Color Palette
  static const Color primaryOrange = Color(0xFFFF9F1C); // Energy/Playful
  static const Color primaryTeal = Color(0xFF2EC4B6);   // Calm/Learning
  static const Color accentPink = Color(0xFFFFBF69);    // Warmth
  static const Color magicalPurple = Color(0xFF6A0572); // Magic/Premium
  static const Color backgroundCream = Color(0xFFFDFFFC);
  
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: backgroundCream,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryOrange,
        primary: primaryOrange,
        secondary: primaryTeal,
        tertiary: magicalPurple,
        surface: backgroundCream,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.fredoka(
          fontSize: 32, 
          fontWeight: FontWeight.bold, 
          color: magicalPurple
        ),
        headlineMedium: GoogleFonts.fredoka(
          fontSize: 24, 
          fontWeight: FontWeight.w600, 
          color: Colors.black87
        ),
        bodyLarge: GoogleFonts.quicksand(
          fontSize: 18, 
          fontWeight: FontWeight.w500
        ),
        labelLarge: GoogleFonts.fredoka(
          fontSize: 16, 
          fontWeight: FontWeight.bold
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.fredoka(
          fontSize: 24, 
          color: magicalPurple, 
          fontWeight: FontWeight.bold
        ),
        iconTheme: const IconThemeData(color: magicalPurple),
      ),
      cardTheme: CardTheme(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryOrange,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          textStyle: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
