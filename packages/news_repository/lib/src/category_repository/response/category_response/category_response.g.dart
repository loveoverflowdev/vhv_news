// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      id: CategoryResponse._parseId(json['_id']),
      title: json['title'] as String,
      treeLevel: (json['treeLevel'] as num).toInt(),
      children: CategoryResponse._parseChildren(json['items'] as List),
      childType: CategoryResponse._parseChildType(json['childType'] as String),
      rewriteURL:
          CategoryResponse._parseRewriteUrl(json['rewriteURL'] as String?),
    );

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'treeLevel': instance.treeLevel,
      'childType': _$CategoryChildTypeEnumMap[instance.childType]!,
      'items': instance.children,
      'rewriteURL': instance.rewriteURL,
    };

const _$CategoryChildTypeEnumMap = {
  CategoryChildType.introduction: 'introduction',
  CategoryChildType.news: 'news',
  CategoryChildType.legalDocument: 'legalDocument',
  CategoryChildType.photoAlbum: 'photoAlbum',
  CategoryChildType.video: 'video',
  CategoryChildType.emagazine: 'emagazine',
  CategoryChildType.song: 'song',
  CategoryChildType.unsupported: 'unsupported',
};
