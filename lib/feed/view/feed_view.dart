
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart' show CategoryChildType;
import 'package:webview_flutter/webview_flutter.dart';

import '../../category/category.dart' show CategoryController;

import '../../article/controller/articles_controller.dart';
import '../widgets/widgets.dart';

class FeedView extends StatelessWidget {
   const FeedView({super.key});

  void _listenCategorySelected() {
    final CategoryController categoryController = Get.find();
    final ArticlesController feedController = Get.find();

    categoryController.selectedCategory.listen((category) {
      switch (category?.childType) {
        case CategoryChildType.introduction:
          feedController.getArticles();
        default:
          feedController.getArticles(categoryId: category?.id);
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
        return switch (currentCategory?.childType) {
          CategoryChildType.introduction => const _FeedIntroduction(),
          CategoryChildType.news => const _FeedArticles(),
          null => const Center(child: CircularProgressIndicator()),
          _ => _FeedWebview(feedUrl: currentCategory?.rewriteURL ?? ''),
        };
      },
    );
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
              return FeedTile(article: article);
            }, separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        );
      },
    );
  }
}

class _FeedWebview extends StatefulWidget {
  final String feedUrl;

  const _FeedWebview({
    required this.feedUrl,
  });

  @override
  State<_FeedWebview> createState() => _FeedWebviewState();
}

class _FeedWebviewState extends State<_FeedWebview> {
  late final WebViewController _webViewController;
  late bool _isLoading;
  late ValueNotifier<int> _progressValueNotifier;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _progressValueNotifier = ValueNotifier(0);

    _webViewController = WebViewController()
    
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              _progressValueNotifier.value = progress;
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
              });

            },
          ),
        )
      ..loadRequest(Uri.parse(widget.feedUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_isLoading)
          Center(
            child: ValueListenableBuilder<int>(
              valueListenable: _progressValueNotifier,
              builder: (context, progress, _) {
                return CircularProgressIndicator(
                  value: progress / 100.0,
                );
              }
            ),
          ),
        WebViewWidget(controller: _webViewController),
      ],
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
