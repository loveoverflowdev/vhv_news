import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class RawVideoPlayerView extends StatefulWidget {
  const RawVideoPlayerView({super.key, required this.url,});

  final String url;

  @override
  State<RawVideoPlayerView> createState() => _RawVideoPlayerViewState();
}

class _RawVideoPlayerViewState extends State<RawVideoPlayerView> {
  late FlickManager _flickManager;
  late VideoPlayerController _videoPlayerController;
  late Object? _error;

  @override
  void initState() {
    super.initState();
    _error = null;
    
    _didUpdateWidget();
  }

  void _didUpdateWidget() {
    String urlStr = widget.url;

    final uri = Uri.tryParse(urlStr);

    if (uri == null) {
      _error = 'Invalid url: $urlStr';
      return;
    }

    _videoPlayerController = VideoPlayerController.networkUrl(uri);
    _flickManager = FlickManager(
      videoPlayerController: _videoPlayerController,
    );
  }


  @override
  void didUpdateWidget(covariant RawVideoPlayerView oldWidget) {
    super.didUpdateWidget(oldWidget);
    _didUpdateWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _error == null,
      replacement: Container(
        color: Colors.black26,
        child: Center(
          child: Text(_error?.toString() ?? '', textAlign: TextAlign.center,),
        ),
      ),
      child: AspectRatio(
        aspectRatio: _videoPlayerController.value.aspectRatio,
        child: FlickVideoPlayer(
          flickManager: _flickManager,
          flickVideoWithControls: const FlickVideoWithControls(
            videoFit: BoxFit.fitHeight,
            controls: FlickPortraitControls(),
          ),
        ),
      ),
    );
  }
}
