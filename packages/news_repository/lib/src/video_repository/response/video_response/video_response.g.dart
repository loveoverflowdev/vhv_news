// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoResponse _$VideoResponseFromJson(Map<String, dynamic> json) =>
    VideoResponse(
      imageUrl: VideoResponse._parseFileUrl(json['image'] as String?),
      id: json['id'] as String,
      title: json['title'] as String,
      brief: json['brief'] as String?,
      totalViews: (json['totalViews'] as num?)?.toInt(),
      creator: json['creatorTitle'] as String?,
      isFeatured:
          VideoResponse._parseIsFeatured((json['isFeatured'] as num?)?.toInt()),
      publishTime: VideoResponse._parseDateTimeFromMillisecondsSinceEpoch(
          (json['publishTime'] as num?)?.toInt()),
      videoLink: json['videoLink'] as String?,
    );

Map<String, dynamic> _$VideoResponseToJson(VideoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'brief': instance.brief,
      'totalViews': instance.totalViews,
      'videoLink': instance.videoLink,
      'publishTime': instance.publishTime?.toIso8601String(),
      'creatorTitle': instance.creator,
      'isFeatured': instance.isFeatured,
      'image': instance.imageUrl,
    };
