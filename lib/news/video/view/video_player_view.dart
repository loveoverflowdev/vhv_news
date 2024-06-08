import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';
import 'package:news_repository/news_repository.dart';

class VideoPlayerView extends StatelessWidget {
  final VideoResponse video;

  const VideoPlayerView({
    super.key, 
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerView(
      url: video.videoLink ?? '',
    );
  }
}
