
import 'package:json_annotation/json_annotation.dart';
import '../../../core/news_api_endpoint.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {

  @JsonKey(name: '_id', fromJson: _parseId)
  final String id;

  final String title;
  final int treeLevel;

  @JsonKey(fromJson: _parseChildType)
  final CategoryChildType childType;

  @JsonKey(name: 'items')
  final List<CategoryResponse> children;

  @JsonKey(name: 'rewriteURL', fromJson: _parseRewriteUrl)
  final String? rewriteURL;

  CategoryResponse({
    required this.id,
    required this.title,
    required this.treeLevel,
    required this.children,
    required this.childType,
    required this.rewriteURL,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);

  static String _parseId(dynamic value) => value.toString();

  static CategoryChildType _parseChildType(String type) => switch (type) {
    'Introduction' => CategoryChildType.introduction,
    'Article.News' => CategoryChildType.news,
    'Article.LegalDocument' => CategoryChildType.legalDocument,
    'Article.PhotoAlbum' => CategoryChildType.photoAlbum,
    'Article.Video' => CategoryChildType.video,
    'Article.Emagazine' => CategoryChildType.emagazine,
    _ => CategoryChildType.unsupported,
  };

  static String? _parseRewriteUrl(String? url) => 
    url != null 
      ? NewsApiEndpoint(resource: url).fileUrl 
      : null;
}

enum CategoryChildType {
  introduction,
  news,
  legalDocument,
  photoAlbum,
  video,
  emagazine,
  unsupported,
}
