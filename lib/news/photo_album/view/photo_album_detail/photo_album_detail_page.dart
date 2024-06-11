
import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart';

import 'photo_album_detail_view.dart';

class PhotoAlbumDetailArgs {
  final PhotoAlbumResponse photoAlbum;

  const PhotoAlbumDetailArgs({required this.photoAlbum});
}

class PhotoAlbumDetailPage extends StatelessWidget {
  static Route route({
    required PhotoAlbumDetailArgs args,
  }) {
    return MaterialPageRoute(
      builder: (context) => PhotoAlbumDetailPage(
        args: args,
      ),
    );
  }

  final PhotoAlbumDetailArgs args;

  const PhotoAlbumDetailPage({super.key, required this.args,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(args.photoAlbum.title),
      ),
      body: PhotoAlbumDetailView(
        photoAlbum: args.photoAlbum,
      ),
    );
  }
}
