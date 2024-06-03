
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart' show CategoryChildType, CategoryResponse;

import '../../category/category.dart' show CategoryController;

import '../../news/article/article.dart';
import '../widgets/widgets.dart';

class FeedView extends StatelessWidget {
   const FeedView({super.key});

  void _listenCategorySelected() {
    final CategoryController categoryController = Get.find();
    final ArticlesController articleController = Get.find();

    categoryController.selectedCategory.listen((category) {
      switch (category?.childType) {
        case CategoryChildType.introduction:
          articleController.getArticles();
        default:
          articleController.getArticles(categoryId: category?.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      initState: (state) {
        _listenCategorySelected();
      },
      builder: (CategoryController controller) {
        final currentCategory = controller.selectedCategory.value;
        return _CategoryFeedView(category: currentCategory,);
      },
    );
  }
}

class _CategoryFeedView extends StatelessWidget {
  final CategoryResponse? category;

  const _CategoryFeedView({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return switch (category?.childType) {
      CategoryChildType.introduction => const _FeedIntroduction(),
      // CategoryChildType.webview => const _FeedArticles(),
      _ => const _FeedArticles(),
    };
  }
}

class _FeedIntroduction extends StatelessWidget {
  const _FeedIntroduction();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticlesController>(
      builder: (ArticlesController controller) {
        final status = controller.status.value;
        final articles = controller.articles;
        return _StatusSwitcher(
          status: status,
          child: Column(
            children: [
              AppCarousel(
                itemCount: articles.length,
                itemBuilder: (BuildContext context, int itemIndex, _ ) {
                  final article = articles[itemIndex];
                  return FeedCarouselCell(
                    imageUrl: article.imageUrl ?? '', 
                    title: article.title, 
                    description: article.brief ?? '', 
                    onTap: () {
                      Navigator.pushNamed(
                        context, 
                        '/detail',
                        arguments: ArticleArgs(articleId: article.id),  
                      );
                    },
                  );
                }, 
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FeedArticles extends StatelessWidget {
  const _FeedArticles();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticlesController>(
      builder: (ArticlesController controller) {
        final status = controller.status.value;
        final articles = controller.articles;

        return _StatusSwitcher(
          status: status,
          child: ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return FeedTile(
                article: article, 
                onTap: () {
                  Navigator.pushNamed(
                    context, 
                    '/detail',
                    arguments: ArticleArgs(articleId: article.id),  
                  );
                },
              );
            }, separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        );
      },
    );
  }
}

class _StatusSwitcher extends StatelessWidget {
  const _StatusSwitcher({required this.status, required this.child});

  final RxStatus status;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (status.isEmpty) {
      return const Center(child: Text('No Data'));
    }
    if (status.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (status.isError) {
      return Center(child: Text('Error: ${status.errorMessage ?? ''}'));
    }
    return child;
  }
}
