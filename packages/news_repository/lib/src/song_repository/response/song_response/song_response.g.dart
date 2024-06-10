// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongResponse _$SongResponseFromJson(Map<String, dynamic> json) => SongResponse(
      id: json['id'] as String,
      publishTime: SongResponse._parseDateTimeFromMillisecondsSinceEpoch(
          (json['publishTime'] as num?)?.toInt()),
      title: json['title'] as String,
      imageUrl: SongResponse._parseFileUrl(json['image'] as String?),
      fileUrl: SongResponse._parseFileUrl(json['file'] as String?),
      creator: json['creatorTitle'] as String?,
    );

Map<String, dynamic> _$SongResponseToJson(SongResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'publishTime': instance.publishTime?.toIso8601String(),
      'title': instance.title,
      'image': instance.imageUrl,
      'file': instance.fileUrl,
      'creatorTitle': instance.creator,
    };
