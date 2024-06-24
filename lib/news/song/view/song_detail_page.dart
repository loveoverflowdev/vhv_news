import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart' show SongResponse;
import 'package:vhv_news/news/song/song.dart';
import 'package:vhv_news/news/song/view/view.dart';

class SongDetailArgs {
  final SongResponse song;

  SongDetailArgs({required this.song});
}

class SongDetailPage extends StatelessWidget {
  static Route route({
    required SongDetailArgs args,
  }) => MaterialPageRoute(
        builder: (context) => SongDetailPage(args: args),
      );

  final SongDetailArgs args;

  const SongDetailPage({super.key, required this.args,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(args.song.title),
      ),
      body: SongPlayerView(
        song: args.song,
      ),
    );
  }
}
