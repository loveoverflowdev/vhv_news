import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';
import 'package:vhv_news/app/app.dart';
import 'package:vhv_news/news/photo_album/photo_album.dart';

import '../../widgets/widgets.dart' show PhotoCell;

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
    )..getPhotoAlbums(categoryId: widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final photoAlbums = _photoAlbumsController.photoAlbums;
      return DefaultTabController(
        length: photoAlbums.length,
        child: SizedBox(
          height: 220,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(124), 
              child: Column(
                children: [
                  AppHeadline(title: widget.category.title),
                  SizedBox(
                    height: 60,
                    child: TabBar(
                      indicatorPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
                      unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
                      labelStyle: Theme.of(context).textTheme.titleSmall,
                      tabs: [
                        for (final photoAlbum in photoAlbums)
                          Tab(
                            text: photoAlbum.title,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    
            body: TabBarView(
              children: [
                for (final photoAlbum in photoAlbums)
                  _PhotoAlbumHeadline(photoAlbum: photoAlbum),
              ],
            ),
          ),
        ),
      );
      },
    );
  }
}

class _PhotoAlbumHeadline extends StatelessWidget {
  const _PhotoAlbumHeadline({
    required this.photoAlbum,
  });

  final PhotoAlbumResponse photoAlbum;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: photoAlbum.photos.isNotEmpty,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          for (final photo in photoAlbum.photos)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xs, 
                vertical: AppSpacing.xs,
              ),
              child: AspectRatio(
                aspectRatio: 12 / 9,
                child: PhotoCell(
                  photo: photo,
                ),
              ),
            )
        ],
      ),
    );
  }
}
