import 'package:flutter/material.dart';

extension ThemeModeExt on ThemeMode {
  inToString() {
    switch (this) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }
}
