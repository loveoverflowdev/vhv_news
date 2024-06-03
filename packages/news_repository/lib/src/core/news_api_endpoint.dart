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

  String get fileUrl => '${protocol.name}://$domain/$resource';
}

enum ArticleType {
  person,
  news,
  photoAlbum,
  legalDocument,
  video,
  emagazine;

  String toParams() {
    switch (this) {
      case ArticleType.person:
        return 'Article.Person';
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
    }
  } 
}

enum Protocol {
  http,
  https,
}
