import 'news_api_endpoint.dart';

String? parseFileUrl(String? url) {
  if (url != null) {
    if (url.contains('http')) {
      return url;
    } else {
      return NewsApiEndpoint(resource: url).fileUrl;
    }
  }
  return null;
}

bool parseBoolFromNum(dynamic value) => (num.tryParse(value.toString()) ?? 0) != 0;

DateTime? parseDateTimeFromMillisecondsSinceEpoch(int? value) 
  => value != null 
    ? DateTime.fromMillisecondsSinceEpoch(value * 1000) 
    : null;
