// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emagazine_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmagazineResponse _$EmagazineResponseFromJson(Map<String, dynamic> json) =>
    EmagazineResponse(
      imageUrl: EmagazineResponse._parseFileUrl(json['image'] as String?),
      id: json['id'] as String,
      title: json['title'] as String,
      brief: json['brief'] as String?,
      totalViews: (json['totalViews'] as num?)?.toInt(),
      creator: json['creatorTitle'] as String?,
      isFeatured: EmagazineResponse._parseIsFeatured(
          (json['isFeatured'] as num?)?.toInt()),
      publishTime: EmagazineResponse._parseDateTimeFromMillisecondsSinceEpoch(
          (json['publishTime'] as num?)?.toInt()),
    );

Map<String, dynamic> _$EmagazineResponseToJson(EmagazineResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'brief': instance.brief,
      'totalViews': instance.totalViews,
      'publishTime': instance.publishTime?.toIso8601String(),
      'creatorTitle': instance.creator,
      'isFeatured': instance.isFeatured,
      'image': instance.imageUrl,
    };
