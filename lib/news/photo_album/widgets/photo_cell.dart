
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart' show PhotoResponse;

class PhotoCell extends StatelessWidget {
  final double? height;
  final double? width;
  final PhotoResponse photo;

  const PhotoCell({
    super.key, 
    required this.photo,
    this.height, 
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AppCachedNetworkImage(
      height: height,
      width: width,
      uri: photo.imageUrl ?? '',
    );
  }
}
