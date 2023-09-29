import 'dart:developer';

import 'package:get/get.dart';
import 'package:hacker_news/data/models/articles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPageController extends GetxController {
  late WebViewController webController;

  final RxString url = ''.obs;
  RxString title = ''.obs;
  RxBool isLoading = false.obs;
  late Article article;

  @override
  Future<void> onInit() async {
    if (Get.arguments is Article) {
      article = Get.arguments as Article;
      url(article.url);
      log(article.url ?? '');
      title('Article Id: ${article.id}');
    }

    isLoading(true);
    webController = WebViewController()
      ..loadRequest(Uri.parse(url()))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            isLoading(true);
          },
          onPageFinished: (url) {
            isLoading(false);
          },
        ),
      );
    super.onInit();
  }
}
