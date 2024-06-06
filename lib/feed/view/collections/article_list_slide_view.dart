import 'package:app_ui/app_ui.dart' show AppCarousel;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../news/article/article.dart';
import '../../widgets/widgets.dart';
import 'common.dart';

class ArticleListSlideView extends StatefulWidget {
  const ArticleListSlideView({super.key});

  @override
  State<ArticleListSlideView> createState() => _ArticleListSlideViewState();
}

class _ArticleListSlideViewState extends State<ArticleListSlideView> {
  late final ArticlesController _articleController;

  @override
  void initState() {
    super.initState();
    _articleController = ArticlesController(articleRepository: Get.find());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => StatusSwitcher(
        status: _articleController.status.value,
        child: Column(
          children: [
            Obx(() => AppCarousel(
              itemCount: _articleController.articles.length,
              itemBuilder: (BuildContext context, int itemIndex, _) {
                final article = _articleController.articles[itemIndex];
                return FeedCarouselCell(
                  imageUrl: article.imageUrl ?? '',
                  title: article.title,
                  description: article.brief ?? '',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/detail',
                      arguments: ArticleDetailArgs(articleId: article.id),
                    );
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
