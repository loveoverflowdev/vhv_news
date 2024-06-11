
import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart' show PhotoAlbumResponse;
import 'package:photo_view/photo_view.dart';

class PhotoAlbumDetailView extends StatelessWidget {
  final PhotoAlbumResponse photoAlbum;
  
  const PhotoAlbumDetailView({
    super.key, 
    required this.photoAlbum,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        for (final photo in photoAlbum.photos)
          Padding(
            padding: const EdgeInsets.all(2),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  // ignore: inference_failure_on_instance_creation
                  MaterialPageRoute(
                    builder: (_) => Scaffold(
                      appBar: AppBar(
                        title: Text(photo.title ?? ''),
                        // backgroundColor: Colors.transparent,
                      ),
                      body: PhotoView(
                        heroAttributes: PhotoViewHeroAttributes(tag: photo.imageUrl ?? ''),
                        imageProvider: CachedNetworkImageProvider(photo.imageUrl ?? ''),
                      ),
                    ),
                  ),
                );
              },
              child: Hero(
                tag: photo.imageUrl ?? '',
                child: AppCachedNetworkImage(uri: photo.imageUrl ?? ''),
              ),
            ),
          ),
      ],
    );
  }
}
