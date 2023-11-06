import 'package:get/get.dart';
import 'package:hacker_news/module/authentication/auth_binding.dart';
import 'package:hacker_news/module/authentication/auth_view.dart';
import 'package:hacker_news/module/new_articles/new_articles_binding.dart';
import 'package:hacker_news/module/new_articles/new_articles_view.dart';
import 'package:hacker_news/module/setting/binding/setting_binding.dart';
import 'package:hacker_news/module/setting/view/setting_view.dart';
import 'package:hacker_news/module/tab/tab_binding.dart';
import 'package:hacker_news/module/tab/tab_view.dart';
import 'package:hacker_news/module/top_articles/top_articles_binding.dart';
import 'package:hacker_news/module/top_articles/top_articles_view.dart';
import 'package:hacker_news/module/web_view_page/bindings/web_view_binding.dart';
import 'package:hacker_news/routes/app_routes.dart';

import '../module/web_view_page/view/web_view.dart';

class AppPages {
  static List<GetPage> getPages() => [
        GetPage(
          name: AppRoutes.auth,
          page: () => const AuthView(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: AppRoutes.tab,
          page: () => const TabsView(),
          binding: TabsBinding(),
        ),
        GetPage(
          name: AppRoutes.topArticles,
          page: () => const TopArticleView(),
          binding: TopArticleBinding(),
        ),
        GetPage(
          name: AppRoutes.newArticles,
          page: () => const NewArticleView(),
          binding: NewArticleBinding(),
        ),
        GetPage(
          name: AppRoutes.setting,
          page: () => const SettingView(),
          binding: SettingBinding(),
        ),
        GetPage(
          name: AppRoutes.webView,
          page: () => const WebViewPage(),
          binding: WebViewPageBinding(),
        ),
      ];
}
