import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hacker_news/data/models/articles.dart';
import 'package:hacker_news/data/remote/api_services.dart';

import '../../serializer.dart';

class ArticleProvider {
  static Future<List<int>> fetchTopArticleIds() async {
    try {
      final Response<List<dynamic>?> response = await APIService.getList(
        path: '/topstories.json',
      );

      if (response.statusCode == 200) {
        List<int> list =
            response.data?.map((e) => int.parse(e.toString())).toList() ?? [];
        return list;
      }
    } on Exception catch (e) {
      log('fetch error: $e');
    }
    return [];
  }

  static Future<List<int>> fetchNewArticleIds() async {
    try {
      final Response<List<dynamic>?> response = await APIService.getList(
        path: '/newstories.json',
      );

      if (response.statusCode == 200) {
        List<int> list =
            response.data?.map((e) => int.parse(e.toString())).toList() ?? [];
        return list;
      }
    } on Exception catch (e) {
      log('fetch error: $e');
    }
    return [];
  }

  static Future<Article> fetchArticle(int id) async {
    try {
      final Response<Map<String, dynamic>?> response =
          await APIService.get(path: '/item/$id.json');

      if (response.statusCode == 200) {
        Article? article = standardSerializers.deserializeWith(
            Article.serializer, response.data);
        return article ?? Article();
      }
    } on Exception catch (e) {
      log('fetch error: $e');
    }

    return Article();
  }
}
