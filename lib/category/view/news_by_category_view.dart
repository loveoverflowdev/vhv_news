import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

import '../../news/article/article.dart';
import '../../news/legal_document/legal_document.dart';
import '../../news/photo_album/photo_album.dart';
import '../../news/video/video.dart';

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
      child: ListView.separated(
        padding: const EdgeInsets.only(bottom: AppSpacing.lg),
        itemCount: (category?.children.length ?? 0) + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _NewsByCategoryChildType(
              category: category!,
            );
          }

          final categoryChild = category!.children[index - 1];
          return _NewsByCategoryChildType(category: categoryChild);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}

class _NewsByCategoryChildType extends StatelessWidget {
  final CategoryResponse category;

  const _NewsByCategoryChildType({
    required this.category, 
  });

  @override
  Widget build(BuildContext context) {
    final Widget body; 
    switch (category.childType) {
      case CategoryChildType.introduction:
        body = const ArticlesSlideView();
      case CategoryChildType.news:
        body = const Placeholder();
      case CategoryChildType.legalDocument:
        body = LegalDocumentsHeadline(
          category: category,
        );
      case CategoryChildType.photoAlbum:
        body = PhotoAlbumsHeadline(
          category: category,
        );
      case CategoryChildType.video:
        body = VideoHeadlines(
          category: category,
        );
      case CategoryChildType.emagazine:
        body = const Placeholder();
      case CategoryChildType.unsupported:
        body = const Placeholder();
    }
    return body;
  }
}


// enum CategoryChildType {
//   introduction,
//   news,
//   legalDocument,
//   photoAlbumn,
//   video,
//   emagazine,
//   unsupported,
// }
