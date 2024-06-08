
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';
import 'package:vhv_news/app/app.dart';

import '../../controller/controller.dart';
import '../../widgets/widgets.dart';
import '../article_detail/article_detail_page.dart';


class ArticlesView extends StatefulWidget {
  final CategoryResponse category;

  const ArticlesView({super.key, required this.category,});

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {

  late final ArticlesController _articlesController;

  @override
  void initState() {
    super.initState();
    _articlesController = ArticlesController(articleRepository: Get.find())
      ..getArticles(
        categoryId: widget.category.id,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => AppStatusSwitcher(
      status: _articlesController.status.value,
      child: Obx(() => ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        itemCount: _articlesController.articles.length,
        itemBuilder: (context, index) {
          final article = _articlesController.articles[index];
          return ArticleTile(
            article: article, 
            onTap: (article) {
              Navigator.pushNamed(
                context, 
                PageRouteName.articleDetail.routeLink,
                arguments: ArticleDetailArgs(articleId: article.id),  
              );
            },
          );
        }, 
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      )),
    ),
    );
  }
}
