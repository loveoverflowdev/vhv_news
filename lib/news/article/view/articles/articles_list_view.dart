import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class ArticlesListView extends StatefulWidget {
  final ScrollPhysics? physics;
  final CategoryResponse category;
  final Widget? header;

  const ArticlesListView({
    super.key,
    required this.category,
    this.physics,
    this.header,
  });

  @override
  State<ArticlesListView> createState() => _ArticlesListViewState();
}

class _ArticlesListViewState extends State<ArticlesListView>
    with AutomaticKeepAliveClientMixin {
  late final ArticlesController _articlesController;

  @override
  void initState() {
    super.initState();
    _articlesController = ArticlesController(articleRepository: Get.find())
      ..setCategoryId(widget.category.id)
      ..loadMoreResponseList();
  }

  @override
  void dispose() {
    _articlesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        _articlesController.refreshResponseList();
      },
      child: Obx(
        () => AppStatusSwitcher(
          status: _articlesController.status.value,
          builder: (_) => Obx(
            () {
              final length = _articlesController.responseList.length + 2;
              final articles = _articlesController.responseList;
      
              return Visibility(
                visible: articles.isNotEmpty,
                replacement: const AppEmptyWidget(),
                child: ListView.separated(
                  physics: widget.physics,
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                  itemCount: length,
                  itemBuilder: (context, index) {
                    if (index == length - 1) {
                      return VisibilityDetector(
                        key: const Key('_ArticlesListViewState.loadMore'),
                        onVisibilityChanged: (visibilityInfo) {
                          final isConsideredVisibility =
                              visibilityInfo.visibleFraction > 0.5;
                          if (isConsideredVisibility) {
                            _articlesController.loadMoreResponseList();
                          }
                        },
                        child:  Visibility(
                        visible: _articlesController.isAbleToLoadMore,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    }
      
                    if (index == 0) {
                      return widget.header ?? const SizedBox.shrink();
                    }
                    final article = articles[index - 1];
                    return ArticleTile(
                      article: article,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
