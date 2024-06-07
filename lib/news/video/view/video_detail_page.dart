
import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart' show VideoResponse;
import 'package:vhv_news/news/video/video.dart';

class VideoDetailArgs {
  // TODO: use detail video
  final VideoResponse video;

  VideoDetailArgs({required this.video});
}

class VideoDetailPage extends StatelessWidget {
  final VideoDetailArgs args;

  static Route route({
    required VideoDetailArgs args,
  }) => MaterialPageRoute(
      builder: (context) => VideoDetailPage(args: args),
      fullscreenDialog: true,
    );

  const VideoDetailPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Player')),
      body: VideoPlayerView(video: args.video),
    );
  }
}
