// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../../../core/utils.dart' as utils;
import '../response.dart';

part 'legal_document_detail_response.g.dart';

@JsonSerializable()
class LegalDocumentDetailResponse {
  final String id;
  final String? title;

  @JsonKey(name: 'creatorTitle')
  final String? creator;

  final String? brief;
  
  @JsonKey(fromJson: _parseIsFeatured)
  final bool isFeatured;

  final String? code;

  @JsonKey(name: 'otherFiles', fromJson: _parseAttachedFiles)
  final List<FileResponse> attachedFiles;

  @JsonKey(fromJson: _parseDateTimeFromMillisecondsSinceEpoch)
  final DateTime? publishTime;

  @JsonKey(fromJson: _parseDateTimeFromMillisecondsSinceEpoch)
  final DateTime? lastUpdateTime;

  LegalDocumentDetailResponse({
    required this.id,
    this.title,
    this.creator,
    this.brief,
    this.code,
    this.lastUpdateTime,
    this.publishTime,
    required this.isFeatured,
    this.attachedFiles = const [],
  });

  factory LegalDocumentDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$LegalDocumentDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LegalDocumentDetailResponseToJson(this);

  static bool _parseIsFeatured(int? isFeatured) => utils.parseBoolFromNum(isFeatured);

  static List<FileResponse> _parseAttachedFiles(dynamic json)
    => json is Map ? json.entries.map((e) => FileResponse.fromJson(e.value)).toList() : [];

  static DateTime? _parseDateTimeFromMillisecondsSinceEpoch(int? publishTime) 
    => utils.parseDateTimeFromMillisecondsSinceEpoch(publishTime);
}
