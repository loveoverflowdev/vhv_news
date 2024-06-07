import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

import '../../news/article/article.dart';
import '../../news/emagazine/emagazine.dart';
import '../../news/legal_document/legal_document.dart';
import '../../news/photo_album/photo_album.dart';
import '../../news/unsupported/unsupported.dart';
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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.lg),
          child: Column(
            children: [
              if (category != null)
                _NewsByCategoryChildType(
                  category: category!,
                ),
              for (final child in category?.children ?? [])
                ...[
                  const Divider(),
                  _NewsByCategoryChildType(
                    category: child,
                  ),
                ]
            ],
          ),
        ),
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
        body = ArticleHeadline(
          category: category,
        );
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
        body = EmagazineHeadlines(
          category: category,
        );
      case CategoryChildType.unsupported:
        body = const UnsupportedView();
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
