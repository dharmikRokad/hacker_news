import 'package:get/get.dart';
import 'package:hacker_news/module/setting/controller/setting_controller.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
    // Get.lazyPut(() => ThemeController());
  }
}
