import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vhv_video_player/vhv_video_player.dart';
import 'package:news_repository/news_repository.dart';

class VideoPlayerView extends StatelessWidget {
  final VideoResponse video;

  const VideoPlayerView({
    super.key, 
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    final Widget subtitle = AppHtmlWidget(
      video.brief ?? '',
      textStyle: Theme.of(context).textTheme.bodySmall,
      customWidgetBuilder: (element) {
        return Text(
          element.text,
        );
      },
    );
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: VhvVideoPlayerView(
            url: video.videoLink ?? '',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                video.title, 
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSpacing.lg),
              subtitle,
              const SizedBox(height: AppSpacing.lg),
              Text(video.creator ?? ''),
            ],
          ),
        )
      ],
    );
  }
}
