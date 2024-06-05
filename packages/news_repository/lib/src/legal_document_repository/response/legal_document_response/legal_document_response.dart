// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../../../core/utils.dart' as utils;
import '../file_response/file_response.dart';

part 'legal_document_response.g.dart';

@JsonSerializable()
class LegalDocumentResponse {
  final String id;
  final String? title;
  final String? code;

  @JsonKey(name: 'creatorTitle')
  final String? creator;

  final String? brief;
  
  @JsonKey(fromJson: _parseIsFeatured)
  final bool isFeatured;

  @JsonKey(name: 'otherFiles', fromJson: _parseAttachedFiles)
  final List<FileResponse> attachedFiles;

  LegalDocumentResponse({
    required this.id,
    this.title,
    this.creator,
    this.brief,
    required this.isFeatured,
    this.code,
    this.attachedFiles = const [],
  });

  factory LegalDocumentResponse.fromJson(Map<String, dynamic> json) =>
      _$LegalDocumentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LegalDocumentResponseToJson(this);

  static bool _parseIsFeatured(int? isFeatured) => utils.parseBoolFromNum(isFeatured);

  static List<FileResponse> _parseAttachedFiles(dynamic json)
  => json is Map ? json.entries.map((e) => FileResponse.fromJson(e.value)).toList() : [];
}
