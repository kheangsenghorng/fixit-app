import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF0056D2),
  scaffoldBackgroundColor: const Color(0xFF121212),

  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF0056D2),
    secondary: Color(0xFFFF6B00),
    surface: Color(0xFF1E1E1E),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white10,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      // FIX: Use BorderSide.none or BorderSide(color: Colors.transparent)
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF0056D2), width: 2),
    ),
  ),
);