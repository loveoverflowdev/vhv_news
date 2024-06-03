import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart' show PhotoAlbumResponse;

class PhotoAlbumTile extends StatelessWidget {
  final PhotoAlbumResponse photoAlbum;
  final void Function(PhotoAlbumResponse photoAlbumResponse) onTap;

  const PhotoAlbumTile({super.key, required this.photoAlbum, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call(photoAlbum);
      },
      child: Row(
        children: [
          AppCachedNetworkImage(uri: photoAlbum.imageUrl ?? ''),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(photoAlbum.title,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 2,
                  ),
                ),
                Text(photoAlbum.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
