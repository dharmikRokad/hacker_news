import 'package:get/get.dart';
import 'package:hacker_news/module/top_articles/top_articles_controller.dart';

class TopArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopArticleController());
  }
}
