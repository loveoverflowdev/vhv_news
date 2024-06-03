// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoResponse _$PhotoResponseFromJson(Map<String, dynamic> json) =>
    PhotoResponse(
      imageUrl: PhotoResponse._parseFileUrl(json['image'] as String?),
      title: json['title'] as String?,
      isAvatar:
          PhotoResponse._parseIsAvatar((json['isAvatar'] as num?)?.toInt()),
    );

Map<String, dynamic> _$PhotoResponseToJson(PhotoResponse instance) =>
    <String, dynamic>{
      'image': instance.imageUrl,
      'title': instance.title,
      'isAvatar': instance.isAvatar,
    };
