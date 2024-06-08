import 'package:json_annotation/json_annotation.dart';
import '../../../core/utils.dart' as utils;

part 'emagazine_detail_response.g.dart';

@JsonSerializable()
class EmagazineDetailResponse {
  final String id;
  final String title;
  final String? brief;
  final int? totalViews;

  @JsonKey(name: 'contents', fromJson: _parseHtmlContents)
  final List<String> htmlContents;

  @JsonKey(fromJson: _parseDateTimeFromMillisecondsSinceEpoch)
  final DateTime? publishTime;

  @JsonKey(name: 'creatorTitle')
  final String? creator;

  @JsonKey(fromJson: _parseIsFeatured)
  final bool isFeatured;

  @JsonKey(name: 'image', fromJson: _parseFileUrl)
  final String? imageUrl;

  EmagazineDetailResponse({
    required this.imageUrl,
    required this.id,
    required this.title,
    required this.brief,
    required this.totalViews,
    required this.creator,
    required this.isFeatured,
    required this.publishTime,
    required this.htmlContents,
  });

  factory EmagazineDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$EmagazineDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmagazineDetailResponseToJson(this);

  static DateTime? _parseDateTimeFromMillisecondsSinceEpoch(int? publishTime) 
    => utils.parseDateTimeFromMillisecondsSinceEpoch(publishTime);
  
  static String? _parseFileUrl(String? url) => utils.parseFileUrl(url);

  static bool _parseIsFeatured(int? isFeatured) => utils.parseBoolFromNum(isFeatured);

  static List<String> _parseHtmlContents(List<dynamic> contents) => contents.map((e) => e['title'] as String).toList();
}
