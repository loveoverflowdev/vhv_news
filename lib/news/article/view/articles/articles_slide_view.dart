import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' show Get, Inst, Obx;
import 'package:news_repository/news_repository.dart';

import '../../controller/controller.dart';
import '../../widgets/widgets.dart' show ArticleCarouselCell;

class ArticlesSlideView extends StatefulWidget {
  final CategoryResponse category;
  const ArticlesSlideView({super.key, required this.category,});

  @override
  State<ArticlesSlideView> createState() => _ArticlesSlideViewState();
}

class _ArticlesSlideViewState extends State<ArticlesSlideView> {

  late final ArticlesController _articlesController;

  @override
  void initState() {
    super.initState();
    _articlesController = ArticlesController(articleRepository: Get.find())
      ..setCategoryId(widget.category.id)
      ..loadMoreResponseList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Obx(
        () => AppCarousel(
          itemBuilder: (context, index, pageIndexView) {
            final article = _articlesController.responseList[index];
            return ArticleCarouselCell(
              article: article,
            );
          }, 
          itemCount: _articlesController.responseList.length,
        ),
      ),
    );
  }
}
