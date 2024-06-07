
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:news_repository/news_repository.dart';

class VideoTile extends StatelessWidget {
  final void Function(VideoResponse)? onTap;
  final VideoResponse video;
  
  const VideoTile({
    super.key, 
    required this.video,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(video),
      child: SizedBox(
        height: 108,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          child: Row(
            children: [
              const SizedBox(width: AppSpacing.lg),
              AspectRatio(
                aspectRatio: 12 / 9,
                child: AppCachedNetworkImage(
                  uri: video.imageUrl ?? '',
                ),
              ),
              const SizedBox(width: AppSpacing.lg),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      video.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Flexible(
                      child: HtmlWidget(
                        video.brief ?? '',
                        textStyle: Theme.of(context).textTheme.bodySmall,
                        customWidgetBuilder: (element) {
                          return Text(
                            element.text,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
