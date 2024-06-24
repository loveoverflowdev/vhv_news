import 'package:flutter/material.dart';
import 'package:vhv_video_player/vhv_video_player.dart';

void main() {
  VhvVideoPlayer.domain = 'vustavinhphuc.coquan.vn';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const YoutubePlayerPage(title: 'Youtube Player Page'),
    );
  }
}

class YoutubePlayerPage extends StatefulWidget {
  const YoutubePlayerPage({super.key, required this.title});

  final String title;

  @override
  State<YoutubePlayerPage> createState() => _YoutubePlayerPageState();
}

class _YoutubePlayerPageState extends State<YoutubePlayerPage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const VhvVideoPlayerView(
        url: 'upload/2006581/20240103/production_id_3997798__1080p_.mp4',
      ),
    );
  }
}
