import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hacker_news/data/get_storage/storage_helper.dart';
import 'package:hacker_news/utils/extensions/theme_mode_extension.dart';

class ThemeController extends GetxController {
  final Rx<ThemeMode> _currentTheme = ThemeMode.light.obs;

  ThemeMode get currentTheme => _currentTheme();

  @override
  void onInit() {
    super.onInit();
    _initializeTheme();
  }

  void _initializeTheme() {
    String savedTheme =
        StorageHelper.read<String>('theme') ?? ThemeMode.light.inToString();
    _currentTheme(
        ThemeMode.values.firstWhere((theme) => theme.inToString() == savedTheme));
  }

  void toggleTheme(ThemeMode newMode) {
    _currentTheme(newMode);
    StorageHelper.write('theme', _currentTheme().inToString());
    _updateThemeMode();
  }

  void _updateThemeMode() {
    Get.changeThemeMode(currentTheme);
  }
}
