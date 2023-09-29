import 'package:get/get.dart';
import 'package:hacker_news/module/new_articles/new_articles_controller.dart';
import 'package:hacker_news/module/tab/tab_controller.dart';
import 'package:hacker_news/module/top_articles/top_articles_controller.dart';

class TabsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TabsController());
    Get.lazyPut(() => TopArticleController());
    Get.lazyPut(() => NewArticleController());
    // Get.lazyPut(() => ThemeController());
  }
}
