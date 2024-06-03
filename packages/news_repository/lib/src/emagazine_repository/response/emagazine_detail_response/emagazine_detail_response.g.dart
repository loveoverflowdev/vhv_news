// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emagazine_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmagazineDetailResponse _$EmagazineDetailResponseFromJson(
        Map<String, dynamic> json) =>
    EmagazineDetailResponse(
      imageUrl: EmagazineDetailResponse._parseFileUrl(json['image'] as String?),
      id: json['id'] as String,
      title: json['title'] as String,
      brief: json['brief'] as String?,
      totalViews: (json['totalViews'] as num?)?.toInt(),
      creator: json['creatorTitle'] as String?,
      isFeatured: EmagazineDetailResponse._parseIsFeatured(
          (json['isFeatured'] as num?)?.toInt()),
      publishTime:
          EmagazineDetailResponse._parseDateTimeFromMillisecondsSinceEpoch(
              (json['publishTime'] as num?)?.toInt()),
      htmlContents: EmagazineDetailResponse._parseHtmlContents(
          json['contents'] as List<Map<dynamic, dynamic>>),
    );

Map<String, dynamic> _$EmagazineDetailResponseToJson(
        EmagazineDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'brief': instance.brief,
      'totalViews': instance.totalViews,
      'contents': instance.htmlContents,
      'publishTime': instance.publishTime?.toIso8601String(),
      'creatorTitle': instance.creator,
      'isFeatured': instance.isFeatured,
      'image': instance.imageUrl,
    };
