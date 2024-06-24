
import 'package:json_annotation/json_annotation.dart';
import '../../../core/utils.dart' as utils;

part 'video_detail_response.g.dart';

@JsonSerializable()
class VideoDetailResponse {
  final String id;
  final String title;
  final String? brief;
  final int? totalViews;

  @JsonKey(fromJson: _parseDateTimeFromMillisecondsSinceEpoch)
  final DateTime? publishTime;

  @JsonKey(name: 'creatorTitle')
  final String? creator;

  @JsonKey(fromJson: _parseIsFeatured)
  final bool isFeatured;

  @JsonKey(name: 'image', fromJson: _parseFileUrl)
  final String? imageUrl;

  @JsonKey(name: 'videoLink', fromJson: _parseFileUrl)
  final String? videoLink;

  VideoDetailResponse({
    required this.imageUrl,
    required this.id,
    required this.title,
    required this.brief,
    required this.totalViews,
    required this.creator,
    required this.isFeatured,
    required this.publishTime,
    required this.videoLink,
  });

  factory VideoDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoDetailResponseToJson(this);

  static DateTime? _parseDateTimeFromMillisecondsSinceEpoch(int? publishTime) 
    => utils.parseDateTimeFromMillisecondsSinceEpoch(publishTime);
  
  static String? _parseFileUrl(String? url) => utils.parseFileUrl(url);

  static bool _parseIsFeatured(int? isFeatured) => utils.parseBoolFromNum(isFeatured);
}
