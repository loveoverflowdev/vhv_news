// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleResponse _$ArticleResponseFromJson(Map<String, dynamic> json) =>
    ArticleResponse(
      imageUrl: ArticleResponse._parseImageUrl(json['image'] as String?),
      id: json['id'] as String,
      title: json['title'] as String,
      brief: json['brief'] as String?,
      totalViews: (json['totalViews'] as num?)?.toInt(),
      creator: json['creatorTitle'] as String?,
      isFeatured: ArticleResponse._parseIsFeatured(json['isFeatured'] as num?),
    );

Map<String, dynamic> _$ArticleResponseToJson(ArticleResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'brief': instance.brief,
      'totalViews': instance.totalViews,
      'creatorTitle': instance.creator,
      'isFeatured': instance.isFeatured,
      'image': instance.imageUrl,
    };
