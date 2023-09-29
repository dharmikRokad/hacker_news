import 'dart:collection';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:hacker_news/data/providers/article_provider.dart';
import '../../data/models/articles.dart';

class NewArticleController extends GetxController {
  RxList<int> ids = <int>[].obs;
  RxList<Article> newArticles = <Article>[].obs;
  RxBool isLoading = false.obs;
  Rx<HashMap<int, Article>> cachedArticles = HashMap<int, Article>().obs;

  @override
  onInit() async {
    await getArticles();
    super.onInit();
  }

  getArticles() async {
    isLoading(true);
    await getIds();
    log('fetching new ids : $ids');
    final List<Future<Article>> futureArticles = ids().map((e) async {
      if (!cachedArticles().containsKey(e)) {
        cachedArticles()[e] = await ArticleProvider.fetchArticle(e);
      }
      return cachedArticles()[e]!;
    }).toList();
    final List<Article> articles = await Future.wait(futureArticles);
    newArticles(articles);
    isLoading(false);
  }

  getIds() async {
    ids(await ArticleProvider.fetchTopArticleIds()
        .then((value) => value.take(25).toList()));
  }
}
