
import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart';

import '../../news/legal_document/legal_document.dart';
import '../../news/photo_album/photo_album.dart';

class NewsByCategoryView extends StatelessWidget {
  final CategoryResponse? category;

  const NewsByCategoryView({
    super.key, 
    required this.category,
  });


  @override
  Widget build(BuildContext context) {
    if (category == null) {
      return const Placeholder(
        child: Text(
          // TODO: localize
          'category is not selected',
        ),
      );
    }
    return ListView.separated(
      itemCount: category!.children.length,
      itemBuilder: (context, index) {
        final categoryChild = category!.children[index];
        switch (categoryChild.childType) {
          case CategoryChildType.introduction:
            return _IntroductionViewHeadline(
              category: categoryChild,
            );
          case CategoryChildType.news:
            return const Placeholder();
          case CategoryChildType.legalDocument:
            return LegalDocumentsHeadline(
              category: categoryChild,
            );
          case CategoryChildType.photoAlbum:
            return PhotoAlbumsHeadline(
              category: categoryChild,
            );
          case CategoryChildType.video:
            return const Placeholder();
          case CategoryChildType.emagazine:
            return const Placeholder();
          case CategoryChildType.unsupported:
            return const Placeholder();
        }
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}

class _IntroductionViewHeadline extends StatelessWidget {
  final CategoryResponse category;

  const _IntroductionViewHeadline({super.key, required this.category,});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
