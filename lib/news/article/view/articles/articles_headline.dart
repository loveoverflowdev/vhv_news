import 'dart:math';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';
import 'package:vhv_news/app/app.dart';

import '../../article.dart';
import '../../widgets/widgets.dart';

class ArticleHeadline extends StatefulWidget {
  final CategoryResponse category;
  
  const ArticleHeadline({
    super.key,
    required this.category,
  });

  @override
  State<ArticleHeadline> createState() => _ArticleHeadlineState();
}

class _ArticleHeadlineState extends State<ArticleHeadline> {
  late final ArticlesController _articlesController;

  @override
  void initState() {
    super.initState();
    _articlesController = ArticlesController(
      articleRepository: Get.find(),
    )
    ..setCategoryId(widget.category.id)
    ..loadMoreResponseList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeadline(
          onTap: () {
            Navigator.pushNamed(
              context, 
              PageRouteName.articles.routeLink, 
              arguments: ArticlesArgs(category: widget.category),
            );
          },
          title: widget.category.title),
        Obx(() {
          final articles = _articlesController.responseList;
          final length = min(3, articles.length);
          return Column(
            children: [
              for (int i = 0; i < length; i++)
                ArticleTile(
                  article: articles[i], 
                ),
            ],
          );
        }),
        // Obx(() => AppCarousel(
        //   itemCount: _articlesController.articles.length,
        //   itemBuilder: (BuildContext context, int itemIndex, _) {
        //     final article = _articlesController.articles[itemIndex];
        //     return ArticleCarouselCell(
        //       imageUrl: article.imageUrl ?? '',
        //       title: article.title,
        //       description: article.brief ?? '',
        //       onTap: () {
        //         Navigator.pushNamed(
        //           context,
        //           PageRouteName.articleDetail.routeLink,
        //           arguments: ArticleDetailArgs(articleId: article.id),
        //         );
        //       },
        //     );
        //   },
        // )),
      ],
    );
  }
}
