
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vhv_news/news/photo_album/widgets/photo_album_tile.dart';

import '../../../../app/app.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';
import '../photo_album_detail/photo_album_detail.dart';

class PhotoAlbumsView extends StatelessWidget {
  const PhotoAlbumsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhotoAlbumsController>(builder: (controller) {
      final status = controller.status.value;
      final photoAlbums = controller.photoAlbums;
      return StatusSwitcher(
        status: status,
        child: ListView.builder(
          itemCount: photoAlbums.length,
          itemBuilder: (context, index) {
            return PhotoAlbumTile(
              photoAlbum: photoAlbums[index], 
              onTap: (photoAlbum) {
                Navigator.pushNamed(
                  context, PageRouteName.photoAlbumDetail.routeLink, 
                  arguments: PhotoAlbumDetailArgs(
                    photoAlbum: photoAlbum,
                  ),
                );
              },
            );
          },
        ),
      );
    },);
  }
}
