import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hacker_news/data/themes/theme_controller.dart';
import 'package:hacker_news/utils/extensions/string_extension.dart';
import '../../../utils/extensions/theme_mode_extension.dart';

class SettingController extends GetxController {
  final ThemeController _themeController = Get.find<ThemeController>();

  RxString selectedTheme = ''.obs;

  @override
  void onInit() async {
    switch (_themeController.currentTheme) {
      case ThemeMode.system:
        selectedTheme('system');
        break;

      case ThemeMode.dark:
        selectedTheme('dark');
        break;

      case ThemeMode.light:
        selectedTheme('light');
        break;
    }
    super.onInit();
  }

  void onOk() {
    print(selectedTheme);
    print(selectedTheme().toThemeMode());
    _themeController.toggleTheme(selectedTheme().toThemeMode());
    Get.back();
  }
}
