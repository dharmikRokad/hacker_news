import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hacker_news/module/top_articles/top_articles_controller.dart';

import '../../ui/article_tile.dart';

class TopArticleView extends GetView<TopArticleController> {
  const TopArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading()
          ? const Center(child: CircularProgressIndicator())
          : Obx(
                  () => ListView.builder(
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    itemCount: controller.topArticles().length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ArticleTile(
                            article: controller.topArticles()[index]),
                      );
                    },
                  ),
                ),
    );
  }
}
