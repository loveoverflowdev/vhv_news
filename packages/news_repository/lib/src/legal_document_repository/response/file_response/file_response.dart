// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'file_response.g.dart';

@JsonSerializable()
class FileResponse {
  final String? title;

  @JsonKey(name: 'file')
  final String fileUrl;
  
  FileResponse({
    required this.title,
    required this.fileUrl,
  });
  
  factory FileResponse.fromJson(Map<String, dynamic> json) =>
      _$FileResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$FileResponseToJson(this);
}
