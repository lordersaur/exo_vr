import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExoTheme {
  // Define your primary and background colors
  static const Color _primaryColor = Color(0xFF1B1440); // #1B1440
  static const Color _surfaceColor = Color(0xFFF1E8DE); // #F1E8DE

  // You can define additional colors or derive them from the primary color
  static const Color _onPrimaryColor = Colors.white;
  static const Color _secondaryColor = Color(0xFFEE76A8); // #EE76A8
  static const Color _onSecondaryColor = Colors.white;

  static const Color _errorColor = Colors.red;
  static const Color _onErrorColor = Colors.white;
  static const Color _onSurfaceColor = Colors.black;
  // Define your TextTheme
  static final TextTheme _textTheme = TextTheme(
    displayLarge: GoogleFonts.spaceGrotesk(fontSize: 57, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.spaceGrotesk(fontSize: 45, fontWeight: FontWeight.bold),
    displaySmall: GoogleFonts.spaceGrotesk(fontSize: 36, fontWeight: FontWeight.bold),
    headlineLarge: GoogleFonts.spaceGrotesk(fontSize: 32, fontWeight: FontWeight.bold),
    headlineMedium: GoogleFonts.spaceGrotesk(fontSize: 28, fontWeight: FontWeight.bold),
    headlineSmall: GoogleFonts.spaceGrotesk(fontSize: 24, fontWeight: FontWeight.bold),
    titleLarge: GoogleFonts.spaceGrotesk(fontSize: 22, fontWeight: FontWeight.w500),
    titleMedium: GoogleFonts.spaceGrotesk(fontSize: 16, fontWeight: FontWeight.w500),
    titleSmall: GoogleFonts.spaceGrotesk(fontSize: 14, fontWeight: FontWeight.w500),
    bodyLarge: GoogleFonts.spaceGrotesk(fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium: GoogleFonts.spaceGrotesk(fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall: GoogleFonts.spaceGrotesk(fontSize: 12, fontWeight: FontWeight.normal),
    labelLarge: GoogleFonts.spaceGrotesk(fontSize: 14, fontWeight: FontWeight.w500),
    labelMedium: GoogleFonts.spaceGrotesk(fontSize: 12, fontWeight: FontWeight.w500),
    labelSmall: GoogleFonts.spaceGrotesk(fontSize: 11, fontWeight: FontWeight.w500),
  );

  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: _primaryColor,
        onPrimary: _onPrimaryColor,
        secondary: _secondaryColor,
        onSecondary: _onSecondaryColor,
        error: _errorColor,
        onError: _onErrorColor,
        surface: _surfaceColor,
        onSurface: _onSurfaceColor,
      ),
      textTheme: _textTheme,
      tabBarTheme: TabBarTheme(
        unselectedLabelStyle: _textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        indicator: null,
        dividerColor: Colors.transparent,
        labelStyle: _textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        labelColor: _secondaryColor,
        unselectedLabelColor: _onPrimaryColor,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: borderRadius),
          ),
        ),
      ),
      outlinedButtonTheme:
          OutlinedButtonThemeData(style: ButtonStyle(shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: borderRadius)))));

  static final BorderRadius borderRadius = BorderRadius.circular(10);
}
