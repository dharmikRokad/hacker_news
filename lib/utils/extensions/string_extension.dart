import 'package:flutter/material.dart';

extension StringExtension on String {
  ThemeMode toThemeMode() {
    switch (this) {
      case 'light':
        return ThemeMode.light;

      case 'dark':
        return ThemeMode.dark;

      case 'system':
        return ThemeMode.system;

      default:
        throw ArgumentError('Invalid Theme Mode: $this');
    }
  }
}
