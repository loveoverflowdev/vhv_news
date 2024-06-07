import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vhv_news/news/photo_album/widgets/photo_album_tile.dart';

import '../../../../app/app.dart';
import '../../controller/controller.dart';
import '../photo_album_detail/photo_album_detail.dart';

class PhotoAlbumsView extends StatefulWidget {
  const PhotoAlbumsView({super.key});

  @override
  State<PhotoAlbumsView> createState() => _PhotoAlbumsViewState();
}

class _PhotoAlbumsViewState extends State<PhotoAlbumsView> {
  late final PhotoAlbumsController _photoAlbumsController;

  @override
  void initState() {
    super.initState();
    _photoAlbumsController = PhotoAlbumsController(
      photoAlbumRepository: Get.find(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
      itemCount: _photoAlbumsController.photoAlbums.length,
      itemBuilder: (context, index) {
        return PhotoAlbumTile(
          photoAlbum: _photoAlbumsController.photoAlbums[index],
          onTap: (photoAlbum) {
            Navigator.pushNamed(
              context,
              PageRouteName.photoAlbumDetail.routeLink,
              arguments: PhotoAlbumDetailArgs(
                photoAlbum: photoAlbum,
              ),
            );
          },
        );
      },
    ));
  }
}
