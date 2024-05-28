// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import '../../../core/utils.dart' as utils;
import '../photo_response/photo_response.dart';

part 'photo_album_response.g.dart';

@JsonSerializable()
class PhotoAlbumResponse {
  final String id;
  final String title;
  
  @JsonKey(fromJson: _parseDateTimeFromMillisecondsSinceEpoch)
  final DateTime? publishTime;
  
  final String? brief;

  @JsonKey(name: 'creatorTitle')
  final String? creator;

  final int? totalViews;
  final int? totalPhoto;

  final List<PhotoResponse> photos;

  PhotoAlbumResponse({
    required this.id,
    required this.title,
    this.publishTime,
    this.brief,
    this.creator,
    this.totalViews,
    this.totalPhoto,
    this.photos = const [],
  });

  factory PhotoAlbumResponse.fromJson(Map<String, dynamic> json) =>
      _$PhotoAlbumResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoAlbumResponseToJson(this);

  static DateTime? _parseDateTimeFromMillisecondsSinceEpoch(int? publishTime) 
    => utils.parseDateTimeFromMillisecondsSinceEpoch(publishTime);
}
