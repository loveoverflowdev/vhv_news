import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';
import 'package:vhv_news/news/video/view/videos_list_view.dart';

import '../../news/article/article.dart';
import '../../news/emagazine/emagazine.dart';
import '../../news/legal_document/legal_document.dart';
import '../../news/photo_album/photo_album.dart';
import '../../news/unsupported/unsupported.dart';
import '../../news/video/video.dart';
import '../widgets/widgets.dart';

class NewsByCategoryView extends StatelessWidget {
  final CategoryResponse? category;

  const NewsByCategoryView({
    super.key, 
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return AppStatusSwitcher(
      status: category != null ? RxStatus.success() : RxStatus.loading(),
      builder: (_) => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.lg),
        child: Visibility(
          visible: category!.children.isNotEmpty,
          replacement: _NewsHeadline(
            category: category!,
          ),
          child: DefaultTabController(
            key: PageStorageKey(category!.id),
            length: category!.children.length, 
            child: Scaffold(
              appBar: CategoriesTabBar(
                tabs: [
                  for (final child in category!.children)
                    CategoryTab(
                      categoryName: child.title,
                    ),
                ],
              ),
              body: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // CategoriesTabBar(
                  //   tabs: [
                  //     for (final child in category!.children)
                  //       CategoryTab(
                  //         categoryName: child.title,
                  //       ),
                  //   ],
                  // ),
                  
                  Expanded(
                    child: TabBarView(
                      children: [
                        for (final child in category!.children)
                          _NewsListView(
                            header: _NewsHeadline(
                              category: category!,
                            ),
                            // physics: const NeverScrollableScrollPhysics(),
                            category: child,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // child: ListView(
        //   children: [
        //     if (category != null)
        //       ...[
        //         _NewsHeadline(
        //         category: category!,
        //         ),
        //         const Divider(),
        //       ],

        //     if (category != null)
        //       DefaultTabController(
        //         key: PageStorageKey(category!.id),
        //         length: category!.children.length, 
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             CategoriesTabBar(
        //               tabs: [
        //                 for (final child in category!.children)
        //                   CategoryTab(
        //                     categoryName: child.title,
        //                   ),
        //               ],
        //             ),
        //             SizedBox(
        //               height: 700,
        //               child: TabBarView(
        //                 children: [
        //                   for (final child in category!.children)
        //                     _NewsListView(
        //                       physics: const NeverScrollableScrollPhysics(),
        //                       category: child,
        //                     ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       )
        //   ],
        // ),
      ),
    );
  }
}

class _NewsHeadline extends StatelessWidget {
  final CategoryResponse category;

  const _NewsHeadline({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final Widget body; 
    switch (category.childType) {
      case CategoryChildType.introduction:
        body = ArticlesSlideView(
          category: category,
        );
      case CategoryChildType.news:
        body = ArticlesSlideView(category: category,);
        // body = ArticleHeadline(
        //   category: category,
        // );
      case CategoryChildType.legalDocument:
        body = const SizedBox.shrink();
      case CategoryChildType.photoAlbum:
        body = PhotoAlbumsHeadline(
          category: category,
        );
      case CategoryChildType.video:
        body = VideoHeadlines(
          category: category,
        );
      case CategoryChildType.emagazine:
        body = EmagazineHeadlines(
          category: category,
        );
      case CategoryChildType.unsupported:
        body = const UnsupportedView();
      case CategoryChildType.song:
        body = const UnsupportedView();
    }
    return body;
  }
}

class _NewsListView extends StatelessWidget {
  final Widget? header;
  final CategoryResponse category;
  final ScrollPhysics? physics;

  const _NewsListView({
    required this.category,
    this.physics,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    final Widget body; 
    switch (category.childType) {
      case CategoryChildType.introduction:
      case CategoryChildType.news:
        body = ArticlesListView(
          header: header,
          category: category,
          physics: physics,
        );
      case CategoryChildType.legalDocument:
        body = LegalDocumentsListView(
          header: header,
          category: category,
          physics: physics,
        );
      case CategoryChildType.photoAlbum:
        body = PhotoAlbumsListView(
          header: header,
          category: category,
          physics: physics,
        );
      case CategoryChildType.video:
        body = VideosListView(
          header: header,
          category: category,
          physics: physics,
        );
      case CategoryChildType.emagazine:
        body = EmagazinesListView(
          header: header,
          category: category,
          physics: physics,
        );
      case CategoryChildType.unsupported:
        body = const UnsupportedView();
      case CategoryChildType.song:
        body = const UnsupportedView();
    }
    return body;
  }
}
