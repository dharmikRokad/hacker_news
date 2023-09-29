import 'package:get/get.dart';
import '../controllers/web_view_controller.dart';

class WebViewPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WebViewPageController());
  }
}
