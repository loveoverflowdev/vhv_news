
import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:news_repository/news_repository.dart' show ArticleDetailResponse;

class ArticleView extends StatelessWidget {
  final ArticleDetailResponse? article;

  const ArticleView({super.key, required this.article,});

  @override
  Widget build(BuildContext context) {
    if (article == null) return const SizedBox.shrink();

    final Widget content = HtmlWidget(
      article?.content ?? '',
      textStyle: const TextStyle(
        fontSize: 14.0,
      ),
      customWidgetBuilder: (element) {
        if (element.localName == 'img') {
          return Container(
            margin: const EdgeInsets.all(AppSpacing.xs),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: 'https://vustavinhphuc.coquan.vn${element.attributes['src'] ?? ''}',
            )
          );
        }
      }
    );

    final Widget coverImage = article?.imageUrl != null ? Padding(
      padding: const EdgeInsets.all(AppSpacing.xs),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: article!.imageUrl!,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    ) : const SizedBox.shrink();

    return ListView(
      children: [
        coverImage,
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                article?.title ?? '',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              content,
            ],
          ),
        ),
        // Text(
        //   article?.title ?? '',
        //   style: const TextStyle(
        //     fontSize: 20.0,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        // const SizedBox(height: 16),
        // content,
      ],
    );
  }
}
