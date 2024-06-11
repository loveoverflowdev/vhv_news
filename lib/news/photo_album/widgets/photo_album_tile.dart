import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart' show PhotoAlbumResponse;

import '../../../app/app.dart';
import '../photo_album.dart';

class PhotoAlbumTile extends StatelessWidget {
  final PhotoAlbumResponse photoAlbum;

  const PhotoAlbumTile({super.key, required this.photoAlbum});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          PageRouteName.photoAlbumDetail.routeLink,
          arguments: PhotoAlbumDetailArgs(
            photoAlbum: photoAlbum,
          ),
        );
      },
      child: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          child: Row(
            children: [
              const SizedBox(width: AppSpacing.lg),
              AspectRatio(
                aspectRatio: 12 / 9,
                child: AppCachedNetworkImage(
                  uri: photoAlbum.imageUrl ?? '',
                ),
              ),
              const SizedBox(width: AppSpacing.lg),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      photoAlbum.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Flexible(
                      child: AppHtmlWidget(
                        photoAlbum.brief ?? '',
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
