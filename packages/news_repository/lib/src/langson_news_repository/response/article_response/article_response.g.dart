// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleResponse _$ArticleResponseFromJson(Map<String, dynamic> json) =>
    ArticleResponse(
      imageUrl: json['image'] as String,
      id: ArticleResponse._parseId(json['id'] as Map<String, dynamic>),
      title: json['title'] as String,
      brief: json['brief'] as String,
      totalViews: (json['totalViews'] as num).toInt(),
      creator: json['creator'] as String,
      isFeatured: ArticleResponse._parseIsFeatured(json['isFeatured'] as num),
    );

Map<String, dynamic> _$ArticleResponseToJson(ArticleResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'brief': instance.brief,
      'totalViews': instance.totalViews,
      'creator': instance.creator,
      'isFeatured': instance.isFeatured,
      'image': instance.imageUrl,
    };
