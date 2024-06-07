import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerView extends StatelessWidget {
  final VideoResponse video;

  const VideoPlayerView({
    super.key, 
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return _YoutubePlayer();
  }
}

class _YoutubePlayer extends StatefulWidget {
  const _YoutubePlayer({super.key});

  @override
  State<_YoutubePlayer> createState() => __YoutubePlayerState();
}

class __YoutubePlayerState extends State<_YoutubePlayer> {
  
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // TODOD: Custom webview
    _controller = YoutubePlayerController(
      initialVideoId: 'r2Xtk1dS_dE',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        onReady: () {
          // _controller.addListener(listener);
        },
    );
  }
}
