
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart';
import 'package:vhv_news/app/app.dart';
import 'package:vhv_news/news/song/song.dart';

class SongTile extends StatelessWidget {
  final SongResponse song;
  
  const SongTile({
    super.key, 
    required this.song,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context, PageRouteName.songDetail.routeLink, 
          arguments: SongDetailArgs(song: song),
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
                  uri: song.imageUrl ?? '',
                ),
              ),
              const SizedBox(width: AppSpacing.lg),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      song.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
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
