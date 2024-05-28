
// ignore_for_file: public_member_api_docs

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    required this.uri, 
    super.key, 
    this.height, 
    this.width,
  });

  static late final String imageDomain;

  final double? height;
  final double? width;
  final String uri;

  @override
  Widget build(BuildContext context) {
    final imageUrl = uri.contains('https') ? uri : 'https://$imageDomain$uri';
    return CachedNetworkImage(
      height: height,
      width: width,
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
