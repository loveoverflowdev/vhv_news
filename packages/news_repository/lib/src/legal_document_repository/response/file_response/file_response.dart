// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../../../core/utils.dart' as utils;

part 'file_response.g.dart';

@JsonSerializable()
class FileResponse {
  final String? title;

  @JsonKey(name: 'file', fromJson: _parseFileUrl)
  final String? fileUrl;
  
  FileResponse({
    required this.title,
    required this.fileUrl,
  });
  
  factory FileResponse.fromJson(Map<String, dynamic> json) =>
      _$FileResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$FileResponseToJson(this);

  static String? _parseFileUrl(String? url) => utils.parseFileUrl(url);
}
