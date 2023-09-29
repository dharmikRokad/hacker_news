import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hacker_news/module/web_view_page/controllers/web_view_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends GetView<WebViewPageController> {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.black54,
        title: Obx(() => Text(controller.title())),
      ),
      body: Obx(
        () => controller.isLoading()
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : WebViewWidget(
                controller: controller.webController,
              ),
      ),
    );
  }
}
