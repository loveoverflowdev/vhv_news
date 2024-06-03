import 'package:app_ui/app_ui.dart' show AppCarousel;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../news/article/article.dart';
import '../../widgets/widgets.dart';
import 'common.dart';

class ArticleListSlideView extends StatelessWidget {
  const ArticleListSlideView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticlesController>(
      init: ArticlesController(articleRepository: Get.find()),
      builder: (ArticlesController controller) {
        final status = controller.status.value;
        final articles = controller.articles;
        return StatusSwitcher(
          status: status,
          child: Column(
            children: [
              AppCarousel(
                itemCount: articles.length,
                itemBuilder: (BuildContext context, int itemIndex, _ ) {
                  final article = articles[itemIndex];
                  return FeedCarouselCell(
                    imageUrl: article.imageUrl ?? '', 
                    title: article.title, 
                    description: article.brief ?? '', 
                    onTap: () {
                      Navigator.pushNamed(
                        context, 
                        '/detail',
                        arguments: ArticleArgs(articleId: article.id),  
                      );
                    },
                  );
                }, 
              ),
            ],
          ),
        );
      },
    );
  }
}
