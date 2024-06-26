import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart';
import 'package:vhv_news/app/app.dart';

import '../view/video_detail_page.dart';


class VideoTile extends StatelessWidget {
  final VideoResponse video;
  
  const VideoTile({
    super.key, 
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 
          PageRouteName.videoDetail.routeLink, 
          arguments: VideoDetailArgs(video: video) ,
        );
      },
      child: SizedBox(
        height: 108,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          child: Row(
            children: [
              const SizedBox(width: AppSpacing.lg),
              AspectRatio(
                aspectRatio: 12 / 9,
                child: AppCachedNetworkImage(
                  uri: video.imageUrl ?? '',
                ),
              ),
              const SizedBox(width: AppSpacing.lg),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      video.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Flexible(
                      child: AppHtmlWidget(
                        video.brief ?? '',
                        textStyle: Theme.of(context).textTheme.bodySmall,
                        customWidgetBuilder: (element) {
                          return Text(
                            element.text,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
