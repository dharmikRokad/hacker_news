import 'package:get/get.dart';
import 'package:hacker_news/routes/app_routes.dart';

import '../../data/local_auth/local_auth.dart';

class AuthController extends GetxController {
  RxBool isFailed = false.obs;

  @override
  Future<void> onInit() async {
    if ((await LocalAuth.authenticate())) {
      Get.offAllNamed(AppRoutes.tab);
    } else {
      isFailed(true);
    }
    super.onInit();
  }
}
