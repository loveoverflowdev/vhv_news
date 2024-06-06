import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../category/category.dart'
    show CategoryController, NewsByCategoryView;


class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();
    return Obx(() => NewsByCategoryView(
      category: categoryController.selectedCategory.value,
    ));
  }
}

// class _CategoryFeedView extends StatelessWidget {
//   final CategoryResponse? category;

//   const _CategoryFeedView({
//     required this.category,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return switch (category?.childType) {
//       null => const Placeholder(),
//       // CategoryChildType.introduction => const _FeedIntroduction(),
//       // CategoryChildType.photoAlbumn => const PhotoAlbumsView(),
//       // CategoryChildType.webview => const _FeedArticles(),
//       _ => NewsByCategoryView(
//           category: category!,
//         ),
//     };
//   }
// }

// class _FeedIntroduction extends StatefulWidget {
//   const _FeedIntroduction();

//   @override
//   State<_FeedIntroduction> createState() => _FeedIntroductionState();
// }

// class _FeedIntroductionState extends State<_FeedIntroduction> {
//   late final ArticlesController _articlesController;

//   @override
//   void initState() {
//     super.initState();
//     _articlesController = ArticlesController(articleRepository: Get.find());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => _StatusSwitcher(
//         status: _articlesController.status.value,
//         child: Column(
//           children: [
//             Obx(() => AppCarousel(
//               itemCount: _articlesController.articles.length,
//               itemBuilder: (BuildContext context, int itemIndex, _) {
//                 final article = _articlesController.articles[itemIndex];
//                 return FeedCarouselCell(
//                   imageUrl: article.imageUrl ?? '',
//                   title: article.title,
//                   description: article.brief ?? '',
//                   onTap: () {
//                     Navigator.pushNamed(
//                       context,
//                       PageRouteName.articleDetail.routeLink,
//                       arguments: ArticleDetailArgs(articleId: article.id),
//                     );
//                   },
//                 );
//               },
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }

