// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongDetailResponse _$SongDetailResponseFromJson(Map<String, dynamic> json) =>
    SongDetailResponse(
      id: json['id'] as String,
      publishTime: SongDetailResponse._parseDateTimeFromMillisecondsSinceEpoch(
          (json['publishTime'] as num?)?.toInt()),
      title: json['title'] as String,
      imageUrl: SongDetailResponse._parseFileUrl(json['image'] as String?),
      fileUrl: SongDetailResponse._parseFileUrl(json['file'] as String?),
      creator: json['creatorTitle'] as String?,
      lyrics: json['lyric'] as String,
    );

Map<String, dynamic> _$SongDetailResponseToJson(SongDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'publishTime': instance.publishTime?.toIso8601String(),
      'title': instance.title,
      'image': instance.imageUrl,
      'file': instance.fileUrl,
      'creatorTitle': instance.creator,
      'lyric': instance.lyrics,
    };
