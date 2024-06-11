
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

import '../../controller/controller.dart';
import '../../widgets/widgets.dart';


class ArticlesListView extends StatefulWidget {
  final ScrollPhysics? physics;
  final CategoryResponse category;
  final Widget? header;

  const ArticlesListView({super.key, required this.category, this.physics, this.header,});

  @override
  State<ArticlesListView> createState() => _ArticlesListViewState();
}

class _ArticlesListViewState extends State<ArticlesListView> with AutomaticKeepAliveClientMixin {

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
  void dispose() {
    _articlesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(() => AppStatusSwitcher(
      status: _articlesController.status.value,
      builder: (_) => Obx(
        () => Visibility(
          visible: _articlesController.articles.isNotEmpty,
          replacement: const AppEmptyWidget(),
          child: ListView.separated(
            physics: widget.physics,
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
            itemCount: _articlesController.articles.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return widget.header ?? const SizedBox.shrink();
              }
              final article = _articlesController.articles[index - 1];
              return ArticleTile(
                article: article, 
              );
            }, 
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        ),
      ),
    ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
