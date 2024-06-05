// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_document_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LegalDocumentResponse _$LegalDocumentResponseFromJson(
        Map<String, dynamic> json) =>
    LegalDocumentResponse(
      id: json['id'] as String,
      title: json['title'] as String?,
      creator: json['creatorTitle'] as String?,
      brief: json['brief'] as String?,
      isFeatured: LegalDocumentResponse._parseIsFeatured(
          (json['isFeatured'] as num?)?.toInt()),
      code: json['code'] as String?,
      attachedFiles: json['otherFiles'] == null
          ? const []
          : LegalDocumentResponse._parseAttachedFiles(json['otherFiles']),
    );

Map<String, dynamic> _$LegalDocumentResponseToJson(
        LegalDocumentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'code': instance.code,
      'creatorTitle': instance.creator,
      'brief': instance.brief,
      'isFeatured': instance.isFeatured,
      'otherFiles': instance.attachedFiles,
    };
