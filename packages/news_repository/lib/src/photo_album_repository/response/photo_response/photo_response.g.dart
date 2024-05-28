// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoResponse _$PhotoResponseFromJson(Map<String, dynamic> json) =>
    PhotoResponse(
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String?,
      isAvatar:
          PhotoResponse._parseIsAvatar((json['isAvatar'] as num?)?.toInt()),
    );

Map<String, dynamic> _$PhotoResponseToJson(PhotoResponse instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'isAvatar': instance.isAvatar,
    };
