// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileResponse _$FileResponseFromJson(Map<String, dynamic> json) => FileResponse(
      title: json['title'] as String?,
      fileUrl: FileResponse._parseFileUrl(json['file'] as String?),
    );

Map<String, dynamic> _$FileResponseToJson(FileResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'file': instance.fileUrl,
    };
