import 'package:json_annotation/json_annotation.dart';

import '../../../core/utils.dart' as utils;

part 'song_response.g.dart';

@JsonSerializable()
class SongResponse {
  final String id;

  @JsonKey(fromJson: _parseDateTimeFromMillisecondsSinceEpoch)
  final DateTime? publishTime;
  final String title;
  
  @JsonKey(name: 'image', fromJson: _parseFileUrl)
  final String? imageUrl;

  @JsonKey(name: 'file', fromJson: _parseFileUrl)
  final String? fileUrl;

  @JsonKey(name: 'creatorTitle')
  final String? creator;

  SongResponse({
    required this.id,
    this.publishTime,
    required this.title,
    required this.imageUrl,
    required this.fileUrl,
    this.creator,
  });

  factory SongResponse.fromJson(Map<String, dynamic> json) =>
      _$SongResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SongResponseToJson(this);


  static String? _parseFileUrl(String? url) => utils.parseFileUrl(url);

  static DateTime? _parseDateTimeFromMillisecondsSinceEpoch(int? publishTime) 
    => utils.parseDateTimeFromMillisecondsSinceEpoch(publishTime);
}
