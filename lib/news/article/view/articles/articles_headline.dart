import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vhv_news/app/app.dart';

import '../../article.dart';
import '../../widgets/widgets.dart';

class ArticleHeadline extends StatelessWidget {
  const ArticleHeadline({super.key});

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
                  return ArticleCarouselCell(
                    imageUrl: article.imageUrl ?? '', 
                    title: article.title, 
                    description: article.brief ?? '', 
                    onTap: () {
                      Navigator.pushNamed(
                        context, 
                        PageRouteName.articleDetail.routeLink,
                        arguments: ArticleDetailArgs(articleId: article.id),  
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
