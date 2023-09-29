import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hacker_news/data/local_auth/local_auth.dart';
import 'package:hacker_news/data/providers/article_provider.dart';
import 'package:hacker_news/module/top_articles/top_articles_controller.dart';
import 'package:hacker_news/routes/app_routes.dart';
import '../article_search.dart';
import '../new_articles/new_articles_controller.dart';

class TabsController extends GetxController {

  @override
  void onInit() {
    update();
    super.onInit();
  }

  RxBool isLoading = false.obs;
  RxInt currentIndex = 0.obs;

  onTabChange(int value) async {
    currentIndex(value);

    if (value == 0) {
      Get.find<TopArticleController>();
    } else if (value == 1) {
      Get.find<NewArticleController>();
    }
  }

  void onSettingClick() {
    Get.toNamed(AppRoutes.setting);
  }

  void onSearchClick(BuildContext context) {
    showSearch(
      context: context,
      delegate: ArticleSearch(),
    );
  }
}
