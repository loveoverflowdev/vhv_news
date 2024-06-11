import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';
import 'package:vhv_news/app/app.dart';

import '../controller/controller.dart';
import '../widgets/widgets.dart';
import 'video_detail_page.dart';

class VideosListView extends StatefulWidget {
  final ScrollPhysics? physics;
  final CategoryResponse category;
  final Widget? header;

  const VideosListView({
    super.key,
    required this.category,
    this.physics,
    this.header,
  });

  @override
  State<VideosListView> createState() => _VideosListViewState();
}

class _VideosListViewState extends State<VideosListView> with AutomaticKeepAliveClientMixin {
  late final VideosController _videosController;

  @override
  void initState() {
    super.initState();
    _videosController = VideosController(
      videoRepository: Get.find(),
    )..getVideos(categoryId: widget.category.id);
  }

  @override
  void dispose() {
    _videosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(
      () {
        final videos = _videosController.videos.value;
        final length = videos.length;
        return Visibility(
          replacement: const AppEmptyWidget(),
          visible: videos.isNotEmpty,
          child: ListView.builder(
            itemCount: length + 1,
            physics: widget.physics,
            itemBuilder:  (context, index) {
              if (index == 0) {
                return widget.header ?? const SizedBox.shrink();
              }
              return VideoTile(
                onTap: (video) {
                  Navigator.pushNamed(context, 
                    PageRouteName.videoDetail.routeLink, 
                    arguments: VideoDetailArgs(video: video) ,
                  );
                },
                video: videos[index - 1],
              );
            },
          ),
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
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
