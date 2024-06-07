
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
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
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
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
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Flexible(
                      child: Text(
                        video.brief ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
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
