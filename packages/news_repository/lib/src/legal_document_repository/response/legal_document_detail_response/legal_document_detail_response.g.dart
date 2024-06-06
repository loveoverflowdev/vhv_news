// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_document_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LegalDocumentDetailResponse _$LegalDocumentDetailResponseFromJson(
        Map<String, dynamic> json) =>
    LegalDocumentDetailResponse(
      id: json['id'] as String,
      title: json['title'] as String?,
      creator: json['creatorTitle'] as String?,
      brief: json['brief'] as String?,
      code: json['code'] as String?,
      lastUpdateTime:
          LegalDocumentDetailResponse._parseDateTimeFromMillisecondsSinceEpoch(
              (json['lastUpdateTime'] as num?)?.toInt()),
      publishTime:
          LegalDocumentDetailResponse._parseDateTimeFromMillisecondsSinceEpoch(
              (json['publishTime'] as num?)?.toInt()),
      isFeatured: LegalDocumentDetailResponse._parseIsFeatured(
          (json['isFeatured'] as num?)?.toInt()),
      attachedFiles: json['otherFiles'] == null
          ? const []
          : LegalDocumentDetailResponse._parseAttachedFiles(json['otherFiles']),
    );

Map<String, dynamic> _$LegalDocumentDetailResponseToJson(
        LegalDocumentDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'creatorTitle': instance.creator,
      'brief': instance.brief,
      'isFeatured': instance.isFeatured,
      'code': instance.code,
      'otherFiles': instance.attachedFiles,
      'publishTime': instance.publishTime?.toIso8601String(),
      'lastUpdateTime': instance.lastUpdateTime?.toIso8601String(),
    };
