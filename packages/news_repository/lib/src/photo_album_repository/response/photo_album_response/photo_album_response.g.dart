// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_album_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoAlbumResponse _$PhotoAlbumResponseFromJson(Map<String, dynamic> json) =>
    PhotoAlbumResponse(
      id: json['id'] as String,
      title: json['title'] as String,
      publishTime: PhotoAlbumResponse._parseDateTimeFromMillisecondsSinceEpoch(
          (json['publishTime'] as num?)?.toInt()),
      brief: json['brief'] as String?,
      creatorTitle: json['creatorTitle'] as String?,
      totalViews: (json['totalViews'] as num?)?.toInt(),
      totalPhoto: (json['totalPhoto'] as num?)?.toInt(),
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => PhotoResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PhotoAlbumResponseToJson(PhotoAlbumResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'publishTime': instance.publishTime?.toIso8601String(),
      'brief': instance.brief,
      'creatorTitle': instance.creatorTitle,
      'totalViews': instance.totalViews,
      'totalPhoto': instance.totalPhoto,
      'photos': instance.photos,
    };
