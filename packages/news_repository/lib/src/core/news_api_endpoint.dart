final class NewsApiEndpoint {
  static late final String domain;
  final String resource;
  final Protocol protocol;
  final ArticleType articleType;

  NewsApiEndpoint({
    required this.resource,
    this.protocol = Protocol.https,
    this.articleType = ArticleType.news,
  });

  String selectApiUrl({
    required String id,
  }) => '${protocol.name}://$domain/api/$resource/select/$id?type=${articleType.toParams()}';

  String selectAllApiUrl() => '${protocol.name}://$domain/api/$resource/selectAll?type=${articleType.toParams()}';

  String search({required String keyword}) {
    final String query;
    if (articleType == ArticleType.all) {
      query = 'keyword=$keyword';
    } else {
      query = 'type=${articleType.toParams()}&keyword=$keyword';
    }
    return '${protocol.name}://$domain/api/$resource/search?$query';
  }

  String get fileUrl => '${protocol.name}://$domain/$resource';
}

enum ArticleType {
  news,
  photoAlbum,
  legalDocument,
  video,
  emagazine,
  song,
  all;

  String toParams() {
    switch (this) {
      case ArticleType.news:
        return 'Article.News';
      case ArticleType.photoAlbum:
        return 'Article.PhotoAlbum';
      case ArticleType.legalDocument:
        return 'Article.LegalDocument';
      case ArticleType.video:
        return 'Article.Video';
      case ArticleType.emagazine:
        return 'Article.Emagazine';
      case ArticleType.song:
        return 'Article.Song';
      case ArticleType.all:
        return '';
    }
  }

  String get localizedTitle => switch (this) {
      ArticleType.news => 'Bài báo',
      ArticleType.photoAlbum => 'Ảnh',
      ArticleType.legalDocument => 'Tài liệu',
      ArticleType.video => 'Video',
      ArticleType.emagazine => 'Tạp Chí',
      ArticleType.song => 'Bài hát',
      ArticleType.all => 'Tất cả',
    };

  static ArticleType fromString(String raw) => values.firstWhere((type) => type.toParams() == raw);
}

enum Protocol {
  http,
  https,
}
