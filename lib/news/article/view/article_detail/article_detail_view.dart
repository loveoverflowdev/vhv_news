import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart' show ArticleDetailResponse;
import 'package:photo_view/photo_view.dart';

class ArticleDetailView extends StatefulWidget {
  final ArticleDetailResponse? article;

  const ArticleDetailView({super.key, required this.article,});

  @override
  State<ArticleDetailView> createState() => _ArticleDetailViewState();
}

class _ArticleDetailViewState extends State<ArticleDetailView> {
  @override
  Widget build(BuildContext context) {
    if (widget.article == null) return const SizedBox.shrink();

    final Widget coverImage = widget.article?.imageUrl != null ? Padding(
      padding: const EdgeInsets.all(AppSpacing.xs),
      child: AppCachedNetworkImage(
        uri: widget.article!.imageUrl!,
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
                widget.article?.title ?? '',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              const Divider(),
              const SizedBox(height: AppSpacing.md),
              AppHtmlWidget(
                widget.article?.content ?? '',
                customWidgetBuilder: (element) {
                  if (element.localName == 'img') {
                    final url = element.attributes['src'] ?? '';
                    final imageUrl = url.contains('https') ? url : 'https://${AppCachedNetworkImage.imageDomain}$url';
                    return Builder(
                      builder: (context) => GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          // ignore: inference_failure_on_instance_creation
                          MaterialPageRoute(
                            builder: (_) => Scaffold(
                              appBar: AppBar(
                                title: Text(element.attributes['alt'] ?? ''),
                                // backgroundColor: Colors.transparent,
                              ),
                              body: PhotoView(
                                heroAttributes: PhotoViewHeroAttributes(tag: url),
                                imageProvider: CachedNetworkImageProvider(imageUrl),
                              ),
                            ),
                          ),
                        ),
                        child: Hero(
                          tag: url, 
                          child: AppCachedNetworkImage(
                            uri: imageUrl,
                          ),
                        ),
                      ),
                    );
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
