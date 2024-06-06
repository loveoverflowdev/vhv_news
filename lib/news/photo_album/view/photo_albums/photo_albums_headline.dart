import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';
import 'package:vhv_news/news/photo_album/photo_album.dart';

class PhotoAlbumsHeadline extends StatefulWidget {
  final CategoryResponse category;

  const PhotoAlbumsHeadline({
    super.key,
    required this.category,
  });

  @override
  State<PhotoAlbumsHeadline> createState() => _PhotoAlbumsHeadlineState();
}

class _PhotoAlbumsHeadlineState extends State<PhotoAlbumsHeadline> {
  late final PhotoAlbumsController _photoAlbumsController;

  @override
  void initState() {
    super.initState();
    _photoAlbumsController = PhotoAlbumsController(
      photoAlbumRepository: Get.find(),
    )..getPhotoAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              widget.category.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: Obx(() {
                final photoAlbums = _photoAlbumsController.photoAlbums;
                final length = min(photoAlbums.length, 3);
                return Column(
                  children: [
                    for (int index = 0; index < length; index++)
                      ListTile(
                        title: Text(
                          photoAlbums[index].title,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
