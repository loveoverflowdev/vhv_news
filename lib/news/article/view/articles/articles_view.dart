
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../../widgets/widgets.dart';
import '../article_detail/article_detail_page.dart';


class ArticlesView extends StatelessWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    final articleController = Get.find<ArticlesController>();
    return Obx(() => StatusSwitcher(
      status: articleController.status.value,
      child: Obx(() => ListView.separated(
        padding: const EdgeInsets.all(AppSpacing.lg),
        itemCount: articleController.articles.length,
        itemBuilder: (context, index) {
          final article = articleController.articles[index];
          return ArticleTile(
            article: article, 
            onTap: (article) {
              Navigator.pushNamed(
                context, 
                '/detail',
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
