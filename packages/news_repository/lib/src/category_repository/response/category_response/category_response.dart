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

  @JsonKey(name: 'items', fromJson: _parseChildren)
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

  static CategoryChildType _parseChildType(String type) => CategoryChildType.fromString(type);

  static String? _parseRewriteUrl(String? url) => 
    url != null 
      ? NewsApiEndpoint(resource: url).fileUrl 
      : null;

  static List<CategoryResponse> _parseChildren(List<dynamic> children) {
    final List<CategoryResponse> categories = children.map((child) => CategoryResponse.fromJson(child)).toList();
    return _flattenCategories(categories).toList();
  }

  static Iterable<CategoryResponse> _flattenCategories(Iterable<CategoryResponse> categories) sync* {
    for (final category in categories) {
      yield category;
      yield* _flattenCategories(category.children);
    }
  }
}

enum CategoryChildType {
  introduction('Introduction'),
  news('Article.News'),
  legalDocument('Article.LegalDocument'),
  photoAlbum('Article.PhotoAlbum'),
  video('Article.Video'),
  emagazine('Article.Emagazine'),
  song('Article.Song'),
  unsupported('_');

  final String raw;

  const CategoryChildType(this.raw);

  static CategoryChildType fromString(String raw) => values.firstWhere((type) => type.raw == raw, orElse: () => unsupported);
}
