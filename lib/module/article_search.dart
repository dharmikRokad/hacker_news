import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hacker_news/data/models/articles.dart';
import 'package:hacker_news/module/top_articles/top_articles_controller.dart';
import 'package:url_launcher/url_launcher.dart' as urlLaunch;

import 'new_articles/new_articles_controller.dart';

class ArticleSearch extends SearchDelegate {
  static TopArticleController _topController = Get.find<TopArticleController>();
  static NewArticleController _newController = Get.find<NewArticleController>();

  RxList<Article> allArticles =
      (_topController.topArticles() + _newController.newArticles()).obs;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_rounded),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return findAndShow(allArticles(), SearchResultType.result);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return findAndShow(allArticles(), SearchResultType.suggestion);
  }

  Widget findAndShow(List<Article> articles, SearchResultType type) {
    final articlesToShow = articles
        .where((p0) =>
            p0.title?.toLowerCase().contains(query.toLowerCase()) ?? false)
        .toList();
    return ListView.builder(
      itemCount: articlesToShow.length,
      itemBuilder: (context, index) {
        Article article = articlesToShow[index];

        if (articles.isEmpty) {
          return const Center(
              child: Text(
            'No data!',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ));
        }

        return ListTile(
          title: Text(article.title ?? ''),
          leading: type == SearchResultType.result
              ? const Icon(Icons.article)
              : null,
          trailing: type == SearchResultType.result
              ? null
              : IconButton(
                  icon: const Icon(CupertinoIcons.arrow_up_left),
                  onPressed: () {
                    query = article.title ?? '';
                  },
                ),
          onTap: () {
            final Uri uri = Uri.parse('${article.url}');
            try {
              urlLaunch.launchUrl(uri);
            } catch (e) {
              return;
            }
            close(context, article);
          },
        );
      },
    );
  }
}

enum SearchResultType { suggestion, result }
