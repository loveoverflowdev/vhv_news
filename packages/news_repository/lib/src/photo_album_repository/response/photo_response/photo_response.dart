import 'package:json_annotation/json_annotation.dart';

import '../../../core/utils.dart' as utils;

part 'photo_response.g.dart';

@JsonSerializable()
class PhotoResponse {
  @JsonKey(name: 'image', fromJson: _parseFileUrl)
  final String? imageUrl;

  final String? title;

  @JsonKey(fromJson: _parseIsAvatar)
  final bool isAvatar;

  PhotoResponse({
    required this.imageUrl,
    required this.title,
    required this.isAvatar,
  });

  factory PhotoResponse.fromJson(Map<String, dynamic> json) => _$PhotoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoResponseToJson(this);

  static bool _parseIsAvatar(int? isFeatured) => utils.parseBoolFromNum(isFeatured);

  static String? _parseFileUrl(String? url) => utils.parseFileUrl(url);
}
