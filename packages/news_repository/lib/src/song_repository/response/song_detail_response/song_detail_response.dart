import 'package:json_annotation/json_annotation.dart';

import '../../../core/utils.dart' as utils;

part 'song_detail_response.g.dart';

@JsonSerializable()
class SongDetailResponse {
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

  @JsonKey(name: 'lyric')
  final String lyrics;

  SongDetailResponse({
    required this.id,
    this.publishTime,
    required this.title,
    required this.imageUrl,
    required this.fileUrl,
    this.creator,
    required this.lyrics,
  });

  factory SongDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$SongDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SongDetailResponseToJson(this);


  static String? _parseFileUrl(String? url) => utils.parseFileUrl(url);

  static DateTime? _parseDateTimeFromMillisecondsSinceEpoch(int? publishTime) 
    => utils.parseDateTimeFromMillisecondsSinceEpoch(publishTime);
}
