import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' show Get, Inst, Obx;

import '../../controller/controller.dart';
import '../../widgets/widgets.dart' show ArticleCarouselCell;

class ArticlesSlideView extends StatefulWidget {
  const ArticlesSlideView({super.key});

  @override
  State<ArticlesSlideView> createState() => _ArticlesSlideViewState();
}

class _ArticlesSlideViewState extends State<ArticlesSlideView> {

  late final ArticlesController _articlesController;

  @override
  void initState() {
    super.initState();
    _articlesController = ArticlesController(articleRepository: Get.find())..getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Obx(
        () => AppCarousel(
          itemBuilder: (context, index, pageIndexView) {
            final article = _articlesController.articles[index];
            return ArticleCarouselCell(
              onTap: () {
      
              },
              imageUrl: article.imageUrl ?? '',
              title: article.title,
              description: article.brief ?? '',
            );
          }, 
          itemCount: _articlesController.articles.length,
        ),
      ),
    );
  }
}
