import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hacker_news/data/themes/app_theme.dart';
import 'package:hacker_news/data/themes/theme_controller.dart';
import 'package:hacker_news/routes/app_pages.dart';
import 'package:hacker_news/routes/app_routes.dart';

void main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeController.currentTheme,
      initialRoute: AppRoutes.auth,
      getPages: AppPages.getPages(),
    );
  }
}
