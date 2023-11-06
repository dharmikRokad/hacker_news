import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hacker_news/module/new_articles/new_articles_view.dart';
import 'package:hacker_news/module/top_articles/top_articles_view.dart';
import 'package:hacker_news/ui/components/headline.dart';
import '../../module/tab/tab_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 5,
          shadowColor: Colors.black54,
          title: HeadLine(
              text: ['Top Articles', 'New Articles'][controller.currentIndex()],
              color: Theme.of(context).colorScheme.primary),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                controller.onSearchClick(context);
              },
            ),
            IconButton(
              onPressed: controller.onSettingClick,
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: Obx(
          () => const [
            TopArticleView(),
            NewArticleView()
          ][controller.currentIndex()],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: controller.currentIndex(),
          onDestinationSelected: controller.onTabChange,
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.bar_chart_sharp), label: 'Top Articles'),
            NavigationDestination(
                icon: Icon(Icons.new_releases_rounded), label: 'New Articles'),
          ],
        ),
      ),
    );
  }
}
