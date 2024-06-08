
import 'package:flutter/material.dart';

import 'raw/raw.dart';
import 'uri_analyzer.dart';
import 'youtube/youtube.dart';

final class VhvVideoPlayer {
  /// Use for video prefix in VHV resource
  static late  String domain;  
} 

class VhvVideoPlayerView extends StatelessWidget {
  final String url;
  
  const VhvVideoPlayerView({
    super.key, 
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return useYoutubePlayer(url) 
      ? YoutubePlayerView(url: url) 
      : RawVideoPlayerView(url: url);
  }
}
