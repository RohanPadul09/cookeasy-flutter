import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepOrange,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
  );
}
