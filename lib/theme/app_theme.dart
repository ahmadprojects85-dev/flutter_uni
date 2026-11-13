import 'package:flutter/material.dart';
// all texts and text style of gentrack live here 

class AppTheme {
  static ThemeData light () => _build(Brightness.light);
    static ThemeData dark () => _build(Brightness.dark);


  static ThemeData _build(Brightness brightness) {
 final scheme = ColorScheme.fromSeed(seedColor: Colors.purpleAccent,
 brightness : brightness ) ; 
    return ThemeData(
      colorScheme : scheme,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        centerTitle: true,
      ),
    );

  }
}