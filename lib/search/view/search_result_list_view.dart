import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart';
import 'package:vhv_news/news/emagazine/widgets/emagazine_tile.dart';
import 'package:vhv_news/news/photo_album/widgets/photo_album_tile.dart';
//
import '../../news/article/widgets/widgets.dart';
import '../../news/legal_document/widgets/widgets.dart';
import '../../news/video/widgets/widgets.dart';

class SearchResultListView extends StatelessWidget {
  final SearchResponse searchResult;
  
  const SearchResultListView({
    super.key,
    required this.searchResult,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      shrinkWrap: true,
      children: [
        for (final article in searchResult.articles)
          ArticleTile(article: article),
        
        for (final legalDoc in searchResult.legalDocuments)
          LegalDocumentTile(legalDoc: legalDoc),
        
        for (final video in searchResult.videos)
          VideoTile(video: video),
        
        for (final photoAlbum in searchResult.photoAlbums)
          PhotoAlbumTile(photoAlbum: photoAlbum),
        
        for (final emagazine in searchResult.emagazines)
          EmagazineTile(emagazine: emagazine),        
      ],
    );
  }
}
