import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart';
import 'package:vhv_news/category/category.dart';
import 'package:vhv_news/news/emagazine/widgets/emagazine_tile.dart';
import 'package:vhv_news/news/legal_document/widgets/widgets.dart';
import 'package:vhv_news/news/photo_album/widgets/photo_album_tile.dart';
import 'package:vhv_news/news/video/widgets/widgets.dart';
//
import '../../news/article/widgets/widgets.dart';
import '../../song/widgets/widgets.dart';

class SearchResultView extends StatelessWidget {
  final SearchResponse searchResult;
  
  const SearchResultView({
    super.key,
    required this.searchResult,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: searchResult.orders.length,
      child: Column(
        mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 48,
              child: CategoriesTabBar(tabs: [
                for (final type in searchResult.orders)
                  CategoryTab(categoryName: type.localizedTitle)
                ],
              ),
            ),
            Flexible(
              child: TabBarView(
                children: [
                  for (final type in searchResult.orders)
                    switch (type) {                
                      ArticleType.news => Visibility(
                        visible: searchResult.articles.isNotEmpty,
                        replacement: const AppEmptyWidget(),
                        child: ListView(
                          children: [
                            for (final article in searchResult.articles)
                              ArticleTile(article: article),
                            ],
                        ),
                      ),
                      ArticleType.photoAlbum => Visibility(
                        replacement: const AppEmptyWidget(),
                        visible: searchResult.photoAlbums.isNotEmpty,
                        child: ListView(
                          children: [
                            for (final photoAlbum in searchResult.photoAlbums)
                              PhotoAlbumTile(photoAlbum: photoAlbum),
                            ],
                        ),
                      ),
                      ArticleType.legalDocument => Visibility(
                        replacement: const AppEmptyWidget(),
                        visible: searchResult.legalDocuments.isNotEmpty,
                        child: ListView(
                          children: [
                            for (final legalDoc in searchResult.legalDocuments)
                              LegalDocumentTile(legalDoc: legalDoc),
                            ],
                        ),
                      ),
                      ArticleType.video => Visibility(
                        replacement: const AppEmptyWidget(),
                        visible: searchResult.videos.isNotEmpty,
                        child: ListView(
                          children: [
                            for (final video in searchResult.videos)
                              VideoTile(video: video),
                            ],
                        ),
                      ),
                      ArticleType.emagazine => Visibility(
                        replacement: const AppEmptyWidget(),
                        visible: searchResult.emagazines.isNotEmpty,
                        child: ListView(
                          children: [
                            for (final emagazine in searchResult.emagazines)
                              EmagazineTile(emagazine: emagazine),
                            ],
                        ),
                      ),
                      ArticleType.song => Visibility(
                        replacement: const AppEmptyWidget(),
                        visible: searchResult.songs.isNotEmpty,
                        child: ListView(
                          children: [
                            for (final article in searchResult.songs)
                              SongTile(song: article),
                            ],
                        ),
                      ),
                      ArticleType.all => const SizedBox.shrink(),
                    },
                ],
              ),
            ),
          ],
        ),
      // child: ListView(
      //   padding: const EdgeInsets.only(bottom: 24),
      //   shrinkWrap: true,
      //   children: [
      //     if (searchResult.articles.isNotEmpty)
      //       AppHeadline(title: 'News', trailing: SizedBox.shrink()),
      //     for (final article in searchResult.articles)
      //       ArticleTile(article: article),
          
      //     if (searchResult.legalDocuments.isNotEmpty)
      //       AppHeadline(title: 'Legal Documents', trailing: SizedBox.shrink()),
      //     for (final legalDoc in searchResult.legalDocuments)
      //       LegalDocumentTile(legalDoc: legalDoc),
          
      //     if (searchResult.videos.isNotEmpty)
      //       AppHeadline(title: 'Videos', trailing: SizedBox.shrink()),
      //     for (final video in searchResult.videos)
      //       VideoTile(video: video),
          
      //     if (searchResult.photoAlbums.isNotEmpty)
      //       AppHeadline(title: 'Photo Albums', trailing: SizedBox.shrink()),
      //     for (final photoAlbum in searchResult.photoAlbums)
      //       PhotoAlbumTile(photoAlbum: photoAlbum),
          
      //     if (searchResult.photoAlbums.isNotEmpty)
      //       AppHeadline(title: 'Emagazine', trailing: SizedBox.shrink()),
      //     for (final emagazine in searchResult.emagazines)
      //       EmagazineTile(emagazine: emagazine),        
      //   ],
      // ),
    );
  }
}
