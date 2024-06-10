import 'package:news_repository/news_repository.dart';


class SearchResponse {
  final List<ArticleResponse> articles;
  final List<EmagazineResponse> emagazines;
  final List<LegalDocumentResponse> legalDocuments;
  final List<PhotoAlbumResponse> photoAlbums;
  final List<VideoResponse> videos;
  final List<SongResponse> songs;

  SearchResponse({
    this.articles = const [],
    this.emagazines = const [],
    this.legalDocuments = const [],
    this.photoAlbums = const [],
    this.videos = const [],
    this.songs = const [],
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

    return SearchResponse(
      articles: articles,
      emagazines: emagazines,
      legalDocuments: legalDocuments,
      photoAlbums: photoAlbums,
      videos: videos,
      songs: songs,
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
