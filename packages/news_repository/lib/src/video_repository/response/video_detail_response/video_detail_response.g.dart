// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoDetailResponse _$VideoDetailResponseFromJson(Map<String, dynamic> json) =>
    VideoDetailResponse(
      imageUrl: VideoDetailResponse._parseFileUrl(json['image'] as String?),
      id: json['id'] as String,
      title: json['title'] as String,
      brief: json['brief'] as String?,
      totalViews: (json['totalViews'] as num?)?.toInt(),
      creator: json['creatorTitle'] as String?,
      isFeatured: VideoDetailResponse._parseIsFeatured(
          (json['isFeatured'] as num?)?.toInt()),
      publishTime: VideoDetailResponse._parseDateTimeFromMillisecondsSinceEpoch(
          (json['publishTime'] as num?)?.toInt()),
    );

Map<String, dynamic> _$VideoDetailResponseToJson(
        VideoDetailResponse instance) =>
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
