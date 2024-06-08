// ignore_for_file: public_member_api_docs

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:photo_view/photo_view.dart';

class AppHtmlWidget extends HtmlWidget {
  AppHtmlWidget(String html, {
    super.key, 
    super.customWidgetBuilder,
    super.textStyle,
    super.customStylesBuilder,
  }) : super(
    html.replaceAll('&nbsp;', ''), 
    factoryBuilder: _PopupPhotoViewWidgetFactory.new,
  );
}

class _PopupPhotoViewWidgetFactory extends WidgetFactory {
  @override
  Widget buildImageWidget(BuildTree tree, ImageSource src) {
    final built = super.buildImageWidget(tree, src);

    if (built is CachedNetworkImage || built is Image) {
      final url = src.url;

      final imageProvider = built is CachedNetworkImage ? 
        CachedNetworkImageProvider(url) 
        : (built! as Image).image;

      return Builder(
        builder: (context) => GestureDetector(
          onTap: () => Navigator.of(context).push(
            // ignore: inference_failure_on_instance_creation
            MaterialPageRoute(
              builder: (_) => Scaffold(
                appBar: AppBar(
                  title: Text(tree.element.attributes['alt'] ?? ''),
                  // backgroundColor: Colors.transparent,
                ),
                body: PhotoView(
                  heroAttributes: PhotoViewHeroAttributes(tag: url),
                  imageProvider: imageProvider,
                ),
              ),
            ),
          ),
          child: Hero(
            tag: url, 
            child: built!,
          ),
        ),
      );
    }

    return built ?? const SizedBox.shrink();
  }

  @override
  void parse(BuildTree tree) {
    if (tree.element.classes.contains('image')) {
      tree.register(BuildOp(defaultStyles: (_) => {'margin': '1em 0'}));
    }

    super.parse(tree);
  }
}
