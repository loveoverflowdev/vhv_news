import 'package:news_repository/news_repository.dart';


class SearchResponse {
  final List<ArticleResponse> articles;
  final List<EmagazineResponse> emagazines;
  final List<LegalDocumentResponse> legalDocuments;
  final List<PhotoAlbumResponse> photoAlbums;
  final List<VideoResponse> videos;
  final List<SongResponse> songs;
  final List<ArticleType> orders;

  bool get isNotEmpty 
    => articles.isNotEmpty 
    || emagazines.isNotEmpty 
    || legalDocuments.isNotEmpty 
    || photoAlbums.isNotEmpty 
    || videos.isNotEmpty 
    || songs.isNotEmpty;


  int get itemCount => articles.length 
    + emagazines.length 
    + legalDocuments.length 
    + photoAlbums.length 
    + videos.length 
    + songs.length;

  SearchResponse({
    this.articles = const [],
    this.emagazines = const [],
    this.legalDocuments = const [],
    this.photoAlbums = const [],
    this.videos = const [],
    this.songs = const [],
    this.orders = ArticleType.values,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    final articlesJson = json['types']['Article']['items'];
    if (articlesJson?.isNotEmpty != true) {
      return SearchResponse();
    }

    final articlesMap = articlesJson as Map;

    final List<ArticleResponse> articles = [];
    final List<EmagazineResponse> emagazines = [];
    final List<LegalDocumentResponse> legalDocuments = [];
    final List<PhotoAlbumResponse> photoAlbums = [];
    final List<VideoResponse> videos = [];
    final List<SongResponse> songs = [];


    for (final article in articlesMap.values) {
      final type = ArticleType.fromString(article['type']);
      switch (type) {
        case ArticleType.news:
          articles.add(ArticleResponse.fromJson(article));
        case ArticleType.legalDocument:
          legalDocuments.add(LegalDocumentResponse.fromJson(article));
        case ArticleType.photoAlbum:
          photoAlbums.add(PhotoAlbumResponse.fromJson(article));
        case ArticleType.video:
          videos.add(VideoResponse.fromJson(article));
        case ArticleType.emagazine:
          emagazines.add(EmagazineResponse.fromJson(article));
        case ArticleType.song:
          songs.add(SongResponse.fromJson(article));
        case ArticleType.all:
          break;
      }
      if (article['type'] == CategoryChildType.emagazine) {
        articles.add(ArticleResponse.fromJson(article));
      }
    }

    List<MapEntry<ArticleType, int>> orderMaps = [
      ArticleType.news,
      ArticleType.photoAlbum,
      ArticleType.legalDocument,
      ArticleType.video,
      ArticleType.emagazine,
      ArticleType.song,
    ].map((e) => MapEntry(e, switch(e) {
      ArticleType.news => articles.length,
      ArticleType.photoAlbum => photoAlbums.length,
      ArticleType.legalDocument => legalDocuments.length,
      ArticleType.video => videos.length,
      ArticleType.emagazine => emagazines.length,
      ArticleType.song => songs.length,
      ArticleType.all => (-1 >>> 1) , // MAX_INT_NUMBER
    })).toList();

    orderMaps.sort(
      (a, b) => b.value.compareTo(a.value),
    );

    return SearchResponse(
      articles: articles,
      emagazines: emagazines,
      legalDocuments: legalDocuments,
      photoAlbums: photoAlbums,
      videos: videos,
      songs: songs,
      orders: orderMaps.map((e) => e.key).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'articles': articles.map((e) => e.toJson()),
      'emagazines': emagazines.map((e) => e.toJson()),
      'legalDocuments': legalDocuments.map((e) => e.toJson()),
      'photoAlbums': photoAlbums.map((e) => e.toJson()),
      'videos': videos.map((e) => e.toJson()),
      'songs': songs.map((e) => e.toJson()),
    };
  }
}
