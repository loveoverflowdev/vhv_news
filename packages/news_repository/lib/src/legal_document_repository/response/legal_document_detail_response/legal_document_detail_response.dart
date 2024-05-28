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

  final List<FileResponse> attachedFiles;

  LegalDocumentDetailResponse({
    required this.id,
    this.title,
    this.creator,
    this.brief,
    required this.isFeatured,
    this.attachedFiles = const [],
  });

  factory LegalDocumentDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$LegalDocumentDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LegalDocumentDetailResponseToJson(this);

  static bool _parseIsFeatured(int? isFeatured) => utils.parseBoolFromNum(isFeatured);
}
