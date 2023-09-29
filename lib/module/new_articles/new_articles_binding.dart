import 'package:get/get.dart';
import 'package:hacker_news/module/new_articles/new_articles_controller.dart';

class NewArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewArticleController());
  }

}
