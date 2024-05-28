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
      isFeatured: LegalDocumentDetailResponse._parseIsFeatured(
          (json['isFeatured'] as num?)?.toInt()),
      attachedFiles: (json['attachedFiles'] as List<dynamic>?)
              ?.map((e) => FileResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LegalDocumentDetailResponseToJson(
        LegalDocumentDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'creatorTitle': instance.creator,
      'brief': instance.brief,
      'isFeatured': instance.isFeatured,
      'attachedFiles': instance.attachedFiles,
    };
