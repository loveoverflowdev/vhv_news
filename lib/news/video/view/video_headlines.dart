import 'dart:math';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

import '../controller/controller.dart';
import '../widgets/widgets.dart';

class VideoHeadlines extends StatefulWidget {
  final CategoryResponse category;

  const VideoHeadlines({
    super.key,
    required this.category,
  });

  @override
  State<VideoHeadlines> createState() => _VideoHeadlinesState();
}

class _VideoHeadlinesState extends State<VideoHeadlines> {
  late final VideosController _videosController;

  @override
  void initState() {
    super.initState();
    _videosController = VideosController(
      videoRepository: Get.find(),
    )..getVideos(categoryId: widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeadline(
          title: widget.category.title,
        ),
        Obx(
          () {
            final videos = _videosController.videos.value;
            final length = min(3, videos.length);
            return Column(
              children: [
                for (var i = 0; i < length; i++) 
                  VideoTile(video: videos[i])
              ],
            );
            // return ListView.builder(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemCount: videos.length,
            //   itemBuilder: (context, index) {
            //     final video = videos[index];
            //     return VideoTile(
            //       video: video,
            //     );
            //   }
            // );
          }
        ),
      ],
    );
  }
}
