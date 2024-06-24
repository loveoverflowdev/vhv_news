import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vhv_video_player/vhv_video_player.dart';
import 'package:news_repository/news_repository.dart';

import '../controller/controller.dart';

class VideoPlayerView extends StatefulWidget {
  final VideoResponse video;

  const VideoPlayerView({
    super.key,
    required this.video,
  });

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late final VideoDetailController _videoDetailController;

  @override
  void initState() {
    super.initState();
    _videoDetailController = VideoDetailController(
      videoRepository: Get.find<VideoRepository>(),
    )..getVideoDetail(videoId: widget.video.id);
  }

  @override
  Widget build(BuildContext context) {
    final Widget subtitle = AppHtmlWidget(
      widget.video.brief ?? '',
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
          child: Obx(() {
            final videoLink = _videoDetailController.videoDetail.value?.videoLink ?? '';
            return VhvVideoPlayerView(
              url: videoLink,
            );
          },
        ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.video.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSpacing.lg),
              subtitle,
              const SizedBox(height: AppSpacing.lg),
              Text(widget.video.creator ?? ''),
            ],
          ),
        )
      ],
    );
  }
}
