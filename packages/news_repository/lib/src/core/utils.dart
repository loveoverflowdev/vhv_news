import 'news_api_endpoint.dart';

String? parseFileUrl(String? url) 
  => url != null 
      ? NewsApiEndpoint(resource: url).fileUrl 
      : null;

bool parseBoolFromNum(num? value) => value != 0;

DateTime? parseDateTimeFromMillisecondsSinceEpoch(int? value) 
  => value != null 
    ? DateTime.fromMillisecondsSinceEpoch(value) 
    : null;
