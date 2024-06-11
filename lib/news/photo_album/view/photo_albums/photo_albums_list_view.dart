import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';
import 'package:vhv_news/news/photo_album/widgets/photo_album_tile.dart';

import '../../controller/controller.dart';

class PhotoAlbumsListView extends StatefulWidget {
  final Widget? header;
  final ScrollPhysics? physics;
  final CategoryResponse category;
  
  const PhotoAlbumsListView({
    super.key, 
    required this.category,
    this.physics,
    this.header,
  });

  @override
  State<PhotoAlbumsListView> createState() => _PhotoAlbumsListViewState();
}

class _PhotoAlbumsListViewState extends State<PhotoAlbumsListView> with AutomaticKeepAliveClientMixin {
  late final PhotoAlbumsController _photoAlbumsController;

  @override
  void initState() {
    super.initState();
    _photoAlbumsController = PhotoAlbumsController(
      photoAlbumRepository: Get.find(),
    )..getPhotoAlbums(categoryId: widget.category.id);
  }

  @override
  void dispose() {
    _photoAlbumsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(
      () => Visibility(
        visible: _photoAlbumsController.photoAlbums.isNotEmpty,
        replacement: const AppEmptyWidget(),
        child: ListView.builder(
          physics: widget.physics,
          itemCount: _photoAlbumsController.photoAlbums.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return widget.header ?? const SizedBox.shrink();
            }
        
            return PhotoAlbumTile(
              photoAlbum: _photoAlbumsController.photoAlbums[index - 1],
            );
          },
        ),
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
