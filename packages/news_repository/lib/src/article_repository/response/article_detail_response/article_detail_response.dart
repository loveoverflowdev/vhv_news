import 'package:json_annotation/json_annotation.dart';
import '../../../core/utils.dart' as utils;

part 'article_detail_response.g.dart';

@JsonSerializable()
class ArticleDetailResponse {
  final String? title;
  final String? brief;
  final int? totalViews;
  final int? totalCharacters;

  final String? content;

  @JsonKey(name: 'rewriteURL', fromJson: _parseFileUrl)
  final String? rewriteUrl;

  @JsonKey(name: 'creatorTitle')
  final String? creator;

  @JsonKey(fromJson: _parseIsFeatured)
  final bool isFeatured;

  @JsonKey(name: 'image', fromJson: _parseFileUrl)
  final String? imageUrl;

  @JsonKey(fromJson: _parseDateTimeFromMillisecondsSinceEpoch)
  final DateTime? publishTime;

  ArticleDetailResponse({
    required this.imageUrl,
    required this.title,
    required this.brief,
    required this.totalViews,
    required this.creator,
    required this.isFeatured,
    required this.content,
    required this.rewriteUrl,
    required this.totalCharacters,
    required this.publishTime,
  });

  factory ArticleDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDetailResponseToJson(this);

  static DateTime? _parseDateTimeFromMillisecondsSinceEpoch(int? publishTime) 
    => utils.parseDateTimeFromMillisecondsSinceEpoch(publishTime);
  
  static String? _parseFileUrl(String? url) => utils.parseFileUrl(url);

  static bool _parseIsFeatured(int? isFeatured) => utils.parseBoolFromNum(isFeatured);
}

/*

{
            "_id": {
                "$oid": "65425fd1ead6a2ec840650d4"
            },
            "createdTime": 1698848721,
            "sortOrder": 1698848721,
            "creatorId": 4077238,
            "site": 2006486,
            "type": "Article.LegalDocument",
            "status": 1,
            "title": "Giấy mời Dự công bố Quyết định kiểm tra việc thực hiện Kết luận thanh tra số 2318_KL-TTCP",
            "categories": [
                1873631
            ],
            "code": "",
            "element": "",
            "documentType": "",
            "otherFiles": [
                {
                    "title": "Giấy mời Dự công bố Quyết định kiểm tra việc thực hiện Kết luận thanh tra số 2318_KL-TTCP",
                    "file": "upload/2006486/20231101/Giay_moi_Du_cong_bo_Quyet_dinh_kiem_tra_viec_thuc_hien_Ket_luan_thanh_tra_so_2318_KL-TTCP_ngay_23_12_2019_cua_Thanh_tra_Chinh_phu___Cong_TTDT_Tinh_Lang_Son_a22ba.pdf"
                }
            ],
            "brief": "Giấy mời Dự công bố Quyết định kiểm tra việc thực hiện Kết luận thanh tra số 2318_KL-TTCP",
            "rewriteURL": "tong-quan/thong-bao-giay-moi-hop/giay-moi-du-cong-bo-quyet-dinh-kiem-tra-viec-thuc-hien-ket-luan-thanh-tra-so-2318_kl-ttcp.html",
            "isFeatured": 0,
            "expire": "0",
            "isDisplay": 1,
            "issueTime": 1710867600,
            "publishTime": 1698848640,
            "tag": "",
            "totalViews": 3,
            "file": "upload/2006486/20231101/Giay_moi_Du_cong_bo_Quyet_dinh_kiem_tra_viec_thuc_hien_Ket_luan_thanh_tra_so_2318_KL-TTCP_ngay_23_12_2019_cua_Thanh_tra_Chinh_phu___Cong_TTDT_Tinh_Lang_Son_a22ba.pdf",
            "creatorTitle": "Admin tỉnh Lạng Sơn",
            "creatorCode": "demoadmintinh",
            "isHot": 0,
            "lastUpdateUserId": 1926847,
            "provinceId": "5657e3ab7f8b9a117c8b4574",
            "id": "65425fd1ead6a2ec840650d4",
            "category": {
                "_id": 1873631,
                "sortOrder": 93,
                "title": "Thông báo, Giấy mời họp",
                "parentId": "1871819",
                "rewriteURL": "tong-quan/thong-bao-giay-moi-hop",
                "id": 1873631
            },
            "totalWords": 124
        }

*/
