// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../../../core/utils.dart' as utils;

part 'legal_document_response.g.dart';

@JsonSerializable()
class LegalDocumentResponse {
  final String id;
  final String? title;

  @JsonKey(name: 'creatorTitle')
  final String? creator;

  final String? brief;
  
  @JsonKey(fromJson: _parseIsFeatured)
  final bool isFeatured;

  LegalDocumentResponse({
    required this.id,
    this.title,
    this.creator,
    this.brief,
    required this.isFeatured,
  });

  factory LegalDocumentResponse.fromJson(Map<String, dynamic> json) =>
      _$LegalDocumentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LegalDocumentResponseToJson(this);

  static bool _parseIsFeatured(int? isFeatured) => utils.parseBoolFromNum(isFeatured);
}
