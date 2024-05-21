// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleDetailResponse _$ArticleDetailResponseFromJson(
        Map<String, dynamic> json) =>
    ArticleDetailResponse(
      imageUrl: ArticleDetailResponse._parseFileUrl(json['image'] as String?),
      id: json['id'] as String,
      title: json['title'] as String,
      brief: json['brief'] as String?,
      totalViews: (json['totalViews'] as num?)?.toInt(),
      creator: json['creatorTitle'] as String?,
      isFeatured:
          ArticleDetailResponse._parseIsFeatured(json['isFeatured'] as num?),
      content: json['content'] as String?,
      rewriteUrl:
          ArticleDetailResponse._parseFileUrl(json['rewriteURL'] as String?),
      totalCharacters: (json['totalCharacters'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ArticleDetailResponseToJson(
        ArticleDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'brief': instance.brief,
      'totalViews': instance.totalViews,
      'totalCharacters': instance.totalCharacters,
      'content': instance.content,
      'rewriteURL': instance.rewriteUrl,
      'creatorTitle': instance.creator,
      'isFeatured': instance.isFeatured,
      'image': instance.imageUrl,
    };
