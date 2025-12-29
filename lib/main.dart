import 'dart:io'; // Required for Platform.isIOS check
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import your internal files
import 'package:fixit/SplashScreen/splash_screen_widget.dart';
import 'package:fixit/core/theme/app_theme.dart';
import 'package:fixit/core/provider/theme_provider.dart';

void main() {
  runApp(
    // Wrap the app with ThemeProvider to manage light/dark state
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the provider to listen for theme changes
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FixIt',

      // Apply your Design System Themes
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,

      /*
         FOR TESTING ALL DARK: Change to -> themeMode: ThemeMode.dark
         FOR PRODUCTION: Keep as -> themeMode: themeProvider.themeMode
      */
      themeMode: ThemeMode.dark,

      // iOS-only platform check logic
      home: Platform.isIOS
          ? const SplashScreenWidget()
          : const Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "This application is currently optimized for iOS only.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}