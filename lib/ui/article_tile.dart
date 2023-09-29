import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hacker_news/routes/app_routes.dart';
import '../data/models/articles.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: Key(article.id.toString()),
      title: Text(
        article.title ?? '',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      collapsedIconColor: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(CupertinoIcons.text_bubble),
                      const SizedBox(
                        width: 8,
                      ),
                      Text.rich(
                        TextSpan(
                          text: '${article.descendants} ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          children: const [
                            TextSpan(
                              text: 'comments',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.webView,
                            arguments: article);
                      },
                      icon: Icon(
                        Icons.launch_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
