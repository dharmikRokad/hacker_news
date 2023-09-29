import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.cyan, brightness: Brightness.light),
    useMaterial3: true,
  );

  static final dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.cyan, brightness: Brightness.dark),
    useMaterial3: true,
  );
}
